function [angle, pointX, pointY] = FaceTriangulation(mouthMap, eyeMap,im)

BW = (255*eyeMap) + mouthMap;
[labelImage] = bwlabel(BW ~= 0);
stats = regionprops('table',labelImage,'Centroid');
centers = stats.Centroid;

t = delaunayTriangulation(centers);

imshow(im);
hold on
plot(centers(:,1),centers(:,2), 'ro')
hold on
triplot(t)
hold on


%%get angle

a1 = [1 0]; % (1./(centers(1,:).^2 + centers(2,:).^2));


eyeDiff = centers(1,:) - centers(2,:)
a2 = eyeDiff ./ norm(eyeDiff);
angle = -acos(dot(a1, a2));

if(eyeDiff < 0)
    angle = -angle;
end



pointX = 100;
pointY = 100;



end

