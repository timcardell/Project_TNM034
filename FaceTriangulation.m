function [image, RotPoint,TransPoint] = FaceTriangulation(eyeMap,mouth,im)
%Eyes
BW = eyeMap*255;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;

%Mouth
BW = mouth;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers2 = stats.Centroid;

%%get angle

eyeDiff = centers(:,2) - centers(:,1);
a1 = [1 0];
a2 = eyeDiff./norm(eyeDiff);

angle = acos(dot(a1,a2));

if eyeDiff(:) < 0
    angle = -angle;
end

%Get RotationalPoint
pointX = centers(:,1);
pointY = centers(:,2);

RotPoint = (pointX + pointY).'/2;
TransPoint = (RotPoint+centers2).'/2;

image = imrotate(im, angle, 'bicubic');

end

