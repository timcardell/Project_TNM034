function output = FaceCrop(im,RotPoint)
    diff = [200, 150];
    RotationPoint = [RotPoint(2), RotPoint(1)];
    
    height = 2 * diff(1);
    width = 2 * diff(2);
    
    cropMinBoundary = RotationPoint - diff;
    cropMinBoundary(cropMinBoundary > 0);
    r = centerCropWindow2d(size(im),[height width]);
    output = imcrop(im, r);
end