
schemer_import('darksteel.prf', true);
im = imread('db0_1.jpg');
%Translation(im);

tnm034(im)

%Rotation(im, pointX, pointY, rotAngle)

test = Rotation(im, 40, 40, 5);
%tnm034(im);
