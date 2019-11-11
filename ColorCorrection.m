function output = ColorCorrection(im)
dim=size(im,3);
output=zeros(size(im));    

    for j=1:dim
        scalVal=sum(sum(im(:,:,j)))/numel(im(:,:,j));
        output(:,:,j)=im(:,:,j)*(127.5/scalVal);
    end
    output = uint8(output);
end