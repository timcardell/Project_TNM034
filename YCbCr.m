function [Y,Cb,Cr] = YCbCr(im)
YCBCR = rgb2ycbcr(im);
 Y  = (YCBCR(:,:,1));
 Cb = (YCBCR(:,:,2));
 Cr = (YCBCR(:,:,3));
end