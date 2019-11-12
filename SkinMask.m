function output = SkinMask(Cb,Cr)

shadows = 255 -(Cr+Cb);
merge = 0.5 .* ((255 - Cr) + Cb);
mask = 255 - (merge + shadows);
mask = histeq(mask);
mask = imgaussfilt(mask);

output = imbinarize(mask,'global');
 g = strel('disk', 7);
 output = imclose(output,g)
 output = imfill(output,'holes');
 g = strel('disk', 22);
 output = imerode(output,g);
 output = imopen(output,g);



end