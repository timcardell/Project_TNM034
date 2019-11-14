%%%%%%%%%%%%%%%%%%%%%%%%%%
function id = tnm034(im)
%
% im: Image of unknown face, RGB-image in uint8 format in the
% range [0,255]
%
% id: The identity number (integer) of the identified person,
% i.e. ?1?, ?2?,?,?16? for the persons belonging to ?db1?
% and ?0? for all other faces.
%
% Your program code.
%%%%%%%%%%%%%%%%%%%%%%%%%% 

%Change lightning illumination
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
  [angle, RotPoint] = FaceTriangulation(mouth,EyeMask,im);
    
 %Rotate image
  rot = Rotation(ColorCorrected_im, RotPoint(1), RotPoint(2), angle);
  
 %Scale image
  [ScaledIm,scale] = Scaling(rot,eyes);
 %Scale Rotationpoint to the new images dimension
  RotPoint(1) = round(RotPoint(1) .* scale);
  RotPoint(2) = round(RotPoint(2) .* scale);
 %Crop image
  CroppedImage = FaceCrop(ScaledIm,RotPoint);

 %Create Database
  DB = CreateDatabase();
  imshow(CroppedImage)
end


