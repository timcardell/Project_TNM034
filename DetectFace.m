function Face = DetectFace(im)%Change lightning illumination
ColorCorrected_im = ColorCorrection(im);

%Change Color space to most accurate one (YCbCr)
[~,Cb,Cr] = YCbCr(ColorCorrected_im);

%Threshold to find Skin_Mask

Skin_mask = SkinMask(Cb,Cr);
Face = ColorCorrected_im.*uint8(Skin_mask);

 %Find the mouth mask containing hopefully only the persons mouth
 mouth = MouthMap(Cb, Cr);

  
 Face = im2double(Face).*(not(mouth));

 [Y,Cb,Cr] = YCbCr(Face);
 %Find The eye mask containing hopefully only the persons eyes
 [EyeMask,eyes] = EyeMap(Y,Cb,Cr);
 EyeMask=(EyeMask);


%Find Triangulation between mouth and eyes
[RotatedImage, RotPoint,TransPoint] = FaceTriangulation(EyeMask,mouth, ColorCorrected_im);
[x,y,~] = size(ColorCorrected_im);


x = x/2;
y = y/2;


PosDiffX = y-TransPoint(1);
PosDiffY = x-TransPoint(2);


TranslatedImage =imtranslate(RotatedImage,[PosDiffX,PosDiffY]);
%Scale image
[ScaledIm,scale] = Scaling(TranslatedImage,eyes);
%ScaledIm = imtranslate(ScaledIm,[PosDiffX,PosDiffY]);
%Scale Rotationpoint to the new images dimension
RotPoint(1) = round(RotPoint(1) .* scale);
RotPoint(2) = round(RotPoint(2) .* scale);

%Crop image
Face = FaceCrop(ScaledIm);

end