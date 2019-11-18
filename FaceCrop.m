function output = FaceCrop(im)
    diff = [200, 150];

    height = 2 * diff(1);
    width = 2 * diff(2);

    r = centerCropWindow2d(size(im),[height width]);
    output = imcrop(im, r);
end