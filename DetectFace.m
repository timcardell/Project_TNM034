function Face = DetectFace(im)%Change lightning illumination
ColorCorrected_im = ColorCorrection(im);

%Change Color space to most accurate one (YCbCr)
[~,Cb,Cr] = YCbCr(ColorCorrected_im);

%Threshold to find Skin_Mask

Skin_mask = SkinMask(Cb,Cr);

FaceImage = ColorCorrected_im.*uint8(Skin_mask);

[Y,Cb,Cr] = YCbCr(FaceImage);
%Find The eye mask containing hopefully only the persons eyes
[EyeMask,eyes] = EyeMap(Y,Cb,Cr);
EyeMask=uint8(EyeMask);
%Find the mouth mask containing hopefully only the persons mouth
mouth = MouthMap(Cb, Cr);
%Find Triangulation between mouth and eyes
[RotatedImage, RotPoint,TransPoint] = FaceTriangulation(EyeMask,mouth, ColorCorrected_im);
[x,y,~] = size(ColorCorrected_im);

x = x/2;
y = y/2;

PosDiffX = x-TransPoint(1);
PosDiffY = y-TransPoint(2);

RotatedImage = imtranslate(RotatedImage,[PosDiffX,PosDiffY]);

%Scale image
[ScaledIm,scale] = Scaling(RotatedImage,eyes);

%Scale Rotationpoint to the new images dimension
RotPoint(1) = round(RotPoint(1) .* scale);
RotPoint(2) = round(RotPoint(2) .* scale);

%Crop image
Face = FaceCrop(ScaledIm,TransPoint);

end