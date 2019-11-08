function [angle] = FaceTriangulation(mouthMap, eyeMap)

BW = (255*eyeMap) + mouthMap;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid')
centers = stats.Centroid;
angle = 1;

imshow(BW)
hold on
plot(centers(:,1),centers(:,2),'b')
hold on;



end

