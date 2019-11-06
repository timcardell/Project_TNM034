function Eye_map = EyeMap(Y,Cr,Cb)

EyeMapC = 1/3 * ((Cb.^2) + ((255-Cr).^2) + (Cb./Cr));

g = strel('disk',2);
EyeMapL = (imdilate(Y,g))./(imerode(Y,g)+1);
Eye_map =  EyeMapC .* EyeMapL;
(Cb./Cr)
end