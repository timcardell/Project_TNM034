function [angle] = FaceTriangulation(mouthMap, eyeMap,im)

BW = (255*eyeMap) + mouthMap;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;
angle = 1;
t = delaunayTriangulation(centers)

hold on
plot(centers(:,1),centers(:,2), 'b*')
hold on
triplot(t)
hold on

end

