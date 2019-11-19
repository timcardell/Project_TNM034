function output = MouthMap(Cb, Cr)

Cb = im2double(Cb);
Cr = im2double(Cr);

n =  0.95 * (mean2((Cr).^2)) / mean2(Cr./Cb);

mouthMap = (Cr.^2) .* ((Cr.^2)-n.*(Cr./Cb)).^2;
mouthMap = mouthMap./max(mouthMap(:));

se = strel('disk',10);
se2 = strel('sphere',3);
mouthMap = imdilate(mouthMap, se);

mouthMap = mouthMap > 0.5;

stats = regionprops('table',mouthMap,'Area','Centroid');
MouthArea = max(stats.Area);
idx = find([stats.Area] >= MouthArea);
CC = bwconncomp(mouthMap);

if(CC.NumObjects > 1)
    mouthMap = ismember(labelmatrix(CC),idx);
end


output = uint8(255.*imclose(mouthMap,se));
output = imopen(output,se2);
end
