function [angle, pointX, pointY] = FaceTriangulation(mouthMap, eyeMap,im)

BW = (255*eyeMap) + mouthMap;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid')
centers = stats.Centroid;

t = delaunayTriangulation(centers)

hold on
plot(centers(:,1),centers(:,2), 'ro')
hold on
triplot(t)
hold on


%%get angle

a1 = [1 0];
angle = acos(dot(a1, (1./(centers(1,:).^2 + centers(2,:).^2)).*(centers(1,:)-centers(2,:))))

if( centers(1,:) - centers(2,:) < 0)
    angle = acos(dot(a1, (1./(centers(1,:).^2 + centers(2,:).^2)).*(centers(1,:)-centers(2,:))));
end

if( centers(1,:) - centers(2,:) > 0)
    angle = -acos(dot(a1, (1./(centers(1,:).^2 + centers(2,:).^2)).*(centers(1,:)-centers(2,:))))
end


pointX = 100;
pointY = 100;



end

