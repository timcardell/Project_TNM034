%%%%%%%%%%%%%%%%%%%%%%%%%%
function TransImage = Translation(im, VecIn)
TransImage = imtranslate(im,VecIn,'bicubic');
%c = imfuse(im,TransImage,'blend');
%imshow(c)

title('Translated Image')
