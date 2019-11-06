function RotatedIm = Rotation(im, pointX, pointY, rotAngle)




[height, width] = size(im); %%get height and width info about the image

%in order to rotate the image, we need to transform the our cartesian
%coord. system to a polar coord. system.
%Get centerpoints and subtract by input point. Then do transformtion to
%polar coords

centerPointX = floor((width/2)+1);
centerPointY = floor((height/2)+1);


%do the actual transformation
[theta, rho] = cart2pol((pointX-centerPointX), (pointY- centerPointY));

radians = rotAngle*pi/180;


newTheta = theta - radians;

%transform back to cartesian

[X, Y] = pol2cart(newTheta, rho);


newCenterPointX = centerPointX + X;
newCenterPointY = centerPointY + Y;

padX = round(abs(pointX-newCenterPointX));
padY = round(abs(pointY-newCenterPointY));



padded = padarray(im, [padX, padY]);




RotatedIm = imrotate(padded, rotAngle, 'bilinear', 'crop');



