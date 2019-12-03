function output = ColorCorrection(im)
[m,n,~]=size(im);
Rmean = sum(sum(im(:,:,1)))/(m*n);
Gmean = sum(sum(im(:,:,2)))/(m*n);
Bmean = sum(sum(im(:,:,3)))/(m*n);
Avg = mean([Rmean Gmean Bmean]);
Kr = Avg/Rmean;
Kg = Avg/Gmean;
Kb = Avg/Bmean;
output(:,:,1) = Kr*double(im(:,:,1));
output(:,:,2) = Kg*double(im(:,:,2));
output(:,:,3) = Kb*double(im(:,:,3));
output = uint8(output);
end