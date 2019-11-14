function [DB,joinedDB] = CreateDatabase()

for i= 1:16
    if i < 10
       DB{i} = ColorCorrection(imread(['db1_0' int2str(i) '.jpg'])); 
    end
    if i >=10
       DB{i} = ColorCorrection(imread(['db1_' int2str(i) '.jpg'])); 
    end
end

im = DB{1};
for i = 2:16
    joinedDB = imfuse(im, DB{i}, 'blend');
end

end