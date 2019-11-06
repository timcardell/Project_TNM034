function output = ColorCorrection(im)
dim=size(im,3);
im = uint8(im);
output=zeros(size(im));    

if (dim==1 || dim==3)
    for j=1:dim
        scalVal=sum(sum(im(:,:,j)))/numel(im(:,:,j));
        output(:,:,j)=im(:,:,j)*(127.5/scalVal);
    end
    output = uint8(output);
end