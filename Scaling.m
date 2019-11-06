function Img_zoomed = Scaling(Img, factor)
 
[h ,w ,c] = size(Img);
wn = w*factor;
hn = h*factor;
Img_zoomed = uint8(zeros(hn, wn));
 
for i= 0:hn-1
  for j= 0:wn-1
    x = floor(j/factor);
    y = floor(i/factor);
    for k= 1:c
      Img_zoomed(i+1, j+1, k) = Img(y+1, x+1, k);
    end
  end
end
 
end