function [Eye_map,eyes] = EyeMap(Y,Cb,Cr)

    Y = im2double(Y);
    Cr = im2double(Cr);
    Cb = im2double(Cb);

    Cb_squared  = Cb.^2;

    TransposeCr = 1-Cr;

    CbDivCr = Cb./Cr;


    EyeMapC = 1/3*(Cb_squared) + 1/3*((TransposeCr).^2) + 1/3*(CbDivCr);

    g = strel('sphere',7);
    Numerator = imdilate(Y,g);
    Denominator = imerode(Y,g);

    EyeMapL = (Numerator)./(Denominator+1);
    EyeMapC_Normalized =  adapthisteq(EyeMapC);

   % Eye_map = imfuse(EyeMapL, EyeMapC_Normalized,'blend');

    Eye_map = EyeMapL.*EyeMapC_Normalized;
    Eye_map = imgaussfilt(Eye_map);
    
    Eye_map = Eye_map >=143/255;
    Eye_map = imfill(Eye_map,'holes');
    g= strel('disk',3);
    Eye_map = imdilate(Eye_map,g);
    
    Eye_map = imfill(Eye_map,'holes');
    
    g = strel('disk',10);
    Eye_map = imdilate(Eye_map,g);
    Eye_map = imfill(Eye_map,'holes');
    stats = regionprops('table',Eye_map,'Area','Centroid');
    CC = bwconncomp(Eye_map,8);
    posMax = max(max(stats.Centroid));
  
     if(CC.NumObjects > 2)
         if(posMax > 400)
               idx = find(stats.Centroid(:,2) < 380);
               Eye_map = ismember(labelmatrix(CC),idx);
               stats = regionprops('table',Eye_map,'Area','Centroid');
               CC = bwconncomp(Eye_map);
         end
         
         if(CC.NumObjects > 2)
           % fprintf('more eyes found \n');
            MaxArea = sort(stats.Area);

            out = MaxArea(end-1);

            idx = find([stats.Area] >= out);
            Eye_map = ismember(labelmatrix(CC),idx);
         end
    end
    
    stats = regionprops('table',Eye_map,'Area','Centroid');
    eyes = stats.Centroid;


   
end