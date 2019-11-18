function [Eye_map,eyes] = EyeMap(Y,Cb,Cr)

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

Eye_map = imfuse(EyeMapL, EyeMapC_Normalized,'blend');
Eye_map = uint8(Eye_map);
g2 = strel('sphere',7);


Eye_map = Eye_map >=120;
Eye_map = imerode(Eye_map,g);
stats = regionprops('table',Eye_map,'Area','Centroid');
idx = find([stats.Area] <= 210);
CC = bwconncomp(Eye_map);

if(CC.NumObjects > 2)
    
    Eye_map = ismember(labelmatrix(CC),idx);
    Eye_map = imopen(Eye_map, g2);
end
    g = strel('sphere',8);
    Eye_map = imdilate(Eye_map,g);
    Eye_map = imfill(Eye_map, 'holes');
   
   CC = bwconncomp(Eye_map);

    if(CC.NumObjects < 1)
        fprintf('No eyes found \n')
    end
     if(CC.NumObjects > 2)
        fprintf('more eyes found \n')
    end
    
    stats = regionprops('table',Eye_map,'Area','Centroid');
    eyes = stats.Centroid;
end