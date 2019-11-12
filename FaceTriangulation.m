function [angle, pointX, pointY] = FaceTriangulation(mouthMap, eyeMap,im)

BW = eyeMap + mouthMap;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;

t = delaunayTriangulation(centers);

imshow(im)
hold on
plot(centers(:,1),centers(:,2), 'ro')
hold on
triplot(t)
hold on


%%get angle

a1 = [1 0];
angle = acos(dot(a1, (1./(centers(1,:).^2 + centers(2,:).^2)).*(centers(1,:)-centers(2,:))));

if( centers(1,:) - centers(2,:) < 0)
    angle = acos(dot(a1, (1./(centers(1,:).^2 + centers(2,:).^2)).*(centers(1,:)-centers(2,:))));
end

if( centers(1,:) - centers(2,:) > 0)
    angle = -acos(dot(a1, (1./(centers(1,:).^2 + centers(2,:).^2)).*(centers(1,:)-centers(2,:))));
end


pointX = centers(3,1);
pointY = centers(3,2);



end

