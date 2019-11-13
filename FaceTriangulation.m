function [angle, RotPoint] = FaceTriangulation(mouthMap, eyeMap,im)

BW = eyeMap + mouthMap;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;

t = delaunayTriangulation(centers);

%%get angle

a1 = [1 0];
eyeDiff = centers(1,:) - centers(2,:);
a2 = eyeDiff ./ norm(eyeDiff);
angle = acos(dot(a1, a2));

if(eyeDiff < 0)
    angle = -angle;
end

pointX = centers(1,:);
pointY = centers(2,:);

RotPoint = (pointX + pointY).'/2


end

