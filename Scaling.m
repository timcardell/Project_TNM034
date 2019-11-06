function Img_zoomed = Scaling(Img,Factor)
Factor = 150/Factor;
Img_zoomed = imresize(Img,Factor);
end