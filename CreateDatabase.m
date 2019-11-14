function [DB,joinedDB] = CreateDatabase()

for i= 1:16
    if i < 10
       DB{i} = ColorCorrection(imread(['db1_0' int2str(i) '.jpg'])); 
    end
    if i >=10
       DB{i} = ColorCorrection(imread(['db1_' int2str(i) '.jpg'])); 
    end
end


for i = 1:16
    
    if i == 3
        continue;
    end
    if i == 8
        continue;
    end
   
    if i == 12
        continue;
    end
    
    [~,Cb,Cr] = YCbCr(DB{i});
    Skin_mask = SkinMask(Cb,Cr);
    FaceImage = DB{i}.*uint8(Skin_mask);
    [Y,Cb,Cr] = YCbCr(FaceImage);
    [EyeMask,eyes] = EyeMap(Y,Cb,Cr);
    [RotatedImage, RotPoint] = FaceTriangulation(EyeMask, DB{i});
    
    [ScaledIm,scale] = Scaling(RotatedImage,eyes);
    
    %Scale Rotationpoint to the new images dimension
    RotPoint(1) = round(RotPoint(1) .* scale);
    RotPoint(2) = round(RotPoint(2) .* scale);
    
    %Crop image
    CroppedImage = FaceCrop(ScaledIm,RotPoint);
    imshow(CroppedImage)
end

end