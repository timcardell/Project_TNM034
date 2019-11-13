function [Img_zoomed,factor] = Scaling(Img,Factor)
factor = 150/norm(Factor(2,:)-Factor(1,:));
Img_zoomed = imresize(Img,factor);
end