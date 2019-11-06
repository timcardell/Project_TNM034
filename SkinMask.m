function output = SkinMask(Cb,Cr, Threshold)

shadows = 255 -(Cr+Cb);
merge = 1/2 * ((255 - Cr) + Cb);
mask = 255 - (merge + shadows);

mask = mask >= Threshold;

output = im2double(imfill(mask,'holes'));
end