function output = MouthMap(Cb, Cr, facemask)

Cb = im2double(Cb);
Cr = im2double(Cr);

n =  0.95 * (mean2((Cr).^2)) / mean2(Cr./Cb);

mouthMap = (Cr.^2) .* ((Cr.^2)-n.*(Cr./Cb)).^2;
mouthMap = mouthMap./max(mouthMap(:));


mouthMap = mouthMap.* facemask;

se = strel('disk',10);

mouthMap = imdilate(mouthMap, se);

mouthMap = mouthMap > 0.5;
output = uint8(255.*imclose(mouthMap,se));


end
