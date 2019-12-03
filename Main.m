
schemer_import('darksteel.prf', true);
for i = 1:16
    if i < 10
        im = (imread(['db1_0' int2str(i) '.jpg']));
    end
    
    if i >=10
        im = (imread(['db1_' int2str(i) '.jpg']));
    end
    
    ID = tnm034(im)
    
    if ID < 1
        ID
    end
    if ID < 10 && ID >= 1
        imres = (imread(['db1_0' int2str(ID) '.jpg']));
        Res = cat(2,im,imres);
      
        % imshow(Res) %Remove comment to view matched face
        
    end
    
    if ID >=10
        imres = (imread(['db1_' int2str(ID) '.jpg']));
        Res = cat(2,im,imres);
          
          %  imshow(Res) %Remove comment to view matched face
        
    end
    
end
