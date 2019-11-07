function output = MouthMap(Cb, Cr)


newCr = im2double(Cr);
newCb = im2double(Cb);


n =  0.95 * (mean2((newCr).^2)) / mean2(newCr./newCb);

mouthMap = (newCr.^2) .* ((newCr.^2)-n.*(newCr./newCb)).^2;



%imshow(output)
end
