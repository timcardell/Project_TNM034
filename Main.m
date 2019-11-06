schemer_import('darksteel.prf')

im = imread('db0_1.jpg');
%Translation(im);


%Rotation(im, pointX, pointY, rotAngle)

test = Rotation(im, 40, 40, 5);
%tnm034(im);



figure
imshow(test)
title('rot Image')