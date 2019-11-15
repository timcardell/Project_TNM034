function [image, RotPoint] = FaceTriangulation(eyeMap,mouth,im)

BW = eyeMap*255;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;

%%get angle

imshow(im)
hold on
plot(centers(:,1),centers(:,2),'b*')
hold on

 a1 = [1 0];
 eyeDiff = centers(:,1) - centers(:,2)
 a2 = eyeDiff ./ norm(eyeDiff);
 angle = atan2(centers(2,2)-centers(2,1),centers(1,2)-centers(1,1));
plot(centers(:,1)/2,centers(:,2)/2,'b*')
hold on
pointX = centers(:,1);
pointY = centers(:,2);

RotPoint = (pointX + pointY).'/2;

image = imrotate(im, angle, 'bicubic');

end

