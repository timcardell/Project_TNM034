%%%%%%%%%%%%%%%%%%%%%%%%%%
function TransImage = Translation(im, VecIn)

TransImage = imtranslate(im,VecIn,'cubic');
imshow(TransImage)

title('Translated Image')
