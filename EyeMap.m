function Eye_map = EyeMap(Y,Cb,Cr)

Y = im2double(Y);
Cr = im2double(Cr);
Cb = im2double(Cb);

Cb_squared  = uint8(255 .*(Cb.^2));
TransposeCr = uint8(255 .*(1-Cr));
CbDivCr = uint8(255 .*(Cb./Cr));

EyeMapC = 1/3.*(Cb_squared) + 1/3.*((TransposeCr).^2) + 1/3.*(CbDivCr) ;

g = strel('disk',7);
Numerator = imdilate(Y,g);
Denominator = imerode(Y,g)+ 1;

EyeMapL = Numerator./Denominator;

EyeMapL = uint8(EyeMapL);
EyeMapC_Normalized =  histeq(EyeMapC);

Eye_map = EyeMapL.* EyeMapC_Normalized;

Eye_map = imdilate(Eye_map, g);
Eye_map = (Eye_map >= 255);

imshow(Eye_map)


end