function CreateDatabase()
Size = 16;
for i= 1:Size
    if i < 10
        DB{i} = ColorCorrection(imread(['db1_0' int2str(i) '.jpg']));
    end
    if i >=10
        DB{i} = ColorCorrection(imread(['db1_' int2str(i) '.jpg']));
    end
end

for i = 1:Size
    DetectImage = DetectFace(DB{i});
    DetectImage = (im2double(DetectImage));
    VectorImage(:,i) = DetectImage(:)
end

meanImage = mean(VectorImage,2);

Res = VectorImage-meanImage;
[eigenVec,~] = eigs(transpose(Res)*Res,Size);
u = Res*eigenVec;
weights = transpose(u)*Res
VecIm = meanImage;

save('database.mat', 'u','weights','VecIm');


end