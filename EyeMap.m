function Eye_map = EyeMap(Y,Cr,Cb)

Y = im2double(Y);
Cr = im2double(Cr);
Cb = im2double(Cb);

Cb_squared  = uint8(255 * mat2gray(Cb.*Cb));
TransposeCr = uint8(255 * mat2gray((255-Cr).^2));
CbDivCr = uint8(255 * mat2gray(Cb./Cr));

EyeMapC =  ( (1/3).*Cb_squared + (1/3).*TransposeCr + (1/3).* CbDivCr);

g = strel('line',15, 90);

Numerator = imdilate(Y,g);
Denominator = imerode(Y,g) + 1;

EyeMapL = Numerator./Denominator;

EyeMapL_Normalized = uint8(255 * mat2gray(EyeMapL));
EyeMapC_Normalized = adapthisteq(EyeMapC,'clipLimit',0.02,'Distribution','rayleigh');

Eye_map =  EyeMapC_Normalized .* EyeMapL_Normalized;
Eye_map_Normalized = uint8(255 * mat2gray(Eye_map));

imshow(EyeMapC_Normalized)

end