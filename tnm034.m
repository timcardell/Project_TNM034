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
 
 Skin_mask = SkinMask(Cb,Cr,130);
 
 FaceImage = ColorCorrected_im.*uint8(Skin_mask);
 [Y,Cb,Cr] = YCbCr(FaceImage);
 
 EyeMask = EyeMap(Y,Cb,Cr);
 imshow(FaceImage);
 imshow(FaceImage.*uint8(EyeMask))
 
 id = 0;
end