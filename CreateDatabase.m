function [DB,joinedDB] = CreateDatabase()

for i= 1:13
    if i < 10
       DB{i} = ColorCorrection(imread(['db4_0' int2str(i) '.jpg'])); 
    end
    if i >=10
       DB{i} = ColorCorrection(imread(['db4_' int2str(i) '.jpg'])); 
    end
end


for i = 1:13    
    [~,Cb,Cr] = YCbCr(DB{i});
    Skin_mask = SkinMask(Cb,Cr);
    FaceImage = DB{i}.*uint8(Skin_mask);
    [Y,Cb,Cr] = YCbCr(FaceImage);
    
    [EyeMask,eyes] = EyeMap(Y,Cb,Cr);
    CC = bwconncomp(EyeMask.*255);
    if CC.NumObjects < 2
       continue; 
    end
    if CC.NumObjects > 2
       continue; 
    end
    [RotatedImage, RotPoint] = FaceTriangulation(EyeMask, DB{i});
    
    [ScaledIm,scale] = Scaling(RotatedImage,eyes);
    
    %Scale Rotationpoint to the new images dimension
    RotPoint(1) = round(RotPoint(1) .* scale);
    RotPoint(2) = round(RotPoint(2) .* scale);
    
    %Crop image
    
    CroppedImage = FaceCrop(ScaledIm,RotPoint);
   [n1,n2] = size(CroppedImage);
    CroppedImage = (im2double(CroppedImage));
    ReshapedImages(:,i) = CroppedImage(:);
end

 meanImage = mean(ReshapedImages,2);
 
 Res = ReshapedImages-meanImage;
 [eigenVec,~] = eigs(transpose(Res)*Res,13);
 u = Res*eigenVec;

 for i =1:13
    first = reshape(u(:,13),[n1,n2]);
    figure
    imshow(first,[])
 end
 
 weights = transpose(u)*Res;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
end