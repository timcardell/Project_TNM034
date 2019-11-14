function [image, RotPoint] = FaceTriangulation(eyeMap,im)

BW = eyeMap*255;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;

%%get angle

 a1 = [1 0];
 eyeDiff = centers(:,1) - centers(:,2);
 a2 = eyeDiff ./ norm(eyeDiff);
 %angle = acos(dot(a1, a2));
 angle = atan2(centers(2,2)-centers(2,1),centers(1,2)-centers(1,1));

pointX = centers(:,1);
pointY = centers(:,2);

RotPoint = (pointX + pointY).'/2;

image = imrotate(im, angle, 'bicubic');
end

