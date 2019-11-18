function [image, RotPoint,TransPoint] = FaceTriangulation(eyeMap,mouth,im)
%Eyes
BW = eyeMap*255;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;

%Mouth
BW = mouth;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid')
centers2 = stats.Centroid;

%%get angle
%angle = atan2(centers(2,2)-centers(2,1),centers(1,2)-centers(1,1));

 eyeDiff = centers(2,1) - centers(2,2);
 a1 = [1, 0];
 a2 = eyeDiff./norm(eyeDiff);
 
 angle = acos(dot(a1,a2));
%Get RotationalPoint
pointX = centers(:,1);
pointY = centers(:,2);

RotPoint = (pointX + pointY).'/2;
TransPoint = (RotPoint+centers2)./2;

image = imrotate(im, angle, 'bicubic');


end

