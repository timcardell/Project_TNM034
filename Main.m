
schemer_import('darksteel.prf', true);

for i= 1:16
    if i < 10
       dataBase{i}=imread(['db1_0' int2str(i) '.jpg']); 
    end
    
    if i >=10
       dataBase{i}=imread(['db1_' int2str(i) '.jpg']); 
    end
    figure
    imshow(dataBase{i})
end
 
im = imread('db0_5.jpg');
figure

%tnm034(im);

