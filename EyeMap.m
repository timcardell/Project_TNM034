function Eye_map = EyeMap(Y,Cb,Cr)

Y = im2double(Y);
Cr = im2double(Cr);
Cb = im2double(Cb);

Cb_squared  = Cb.^2;
Cb_squared =255*(Cb_squared./max(max(Cb_squared)));

TransposeCr = 255-Cr;
TransposeCr =255*( TransposeCr./max(max(TransposeCr)));

CbDivCr = Cb./Cr;
CbDivCr =255*( CbDivCr./max(max(CbDivCr)));

 EyeMapC = 1/3*(Cb_squared) + 1/3*((TransposeCr).^2) + 1/3*(CbDivCr);

g = strel('sphere',7);
Numerator = imdilate(Y,g);
Denominator = imerode(Y,g);

EyeMapL = double(Numerator)./double(Denominator+1);
EyeMapL = 255*( EyeMapL./max(max(EyeMapL)));
EyeMapC_Normalized =  histeq(EyeMapC);

Eye_map = imfuse(EyeMapL, EyeMapC_Normalized, 'blend');
Eye_map = uint8(Eye_map);

SE2 = strel('sphere',7);
Eye_map = imopen(Eye_map, SE2);
Eye_map = Eye_map >=120;


end