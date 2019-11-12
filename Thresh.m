function output = Thresh(image, Threshold)

limit = 0.2;
Bigger = (image >= Threshold);
Less = (image < Threshold);
meanB = mean(Bigger, 'all')
meanL = mean(Less, 'all')
new = (meanB + meanL)/2;
if(Threshold-new > limit)
   output = Thresh(image,new);
end
if(Threshold-new <= limit)
    output = (meanB + meanL)/2
end

end