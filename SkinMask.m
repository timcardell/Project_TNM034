function output = SkinMask(Cb,Cr, Threshold)

shadows = 255 -(Cr+Cb);
merge = 0.5 .* ((255 - Cr) + Cb);
mask = 255 - (merge + shadows);

mask = (mask >= Threshold);
g = strel('disk', 30);
mask = imopen(mask,g);

output = imfill(mask,'holes');

end