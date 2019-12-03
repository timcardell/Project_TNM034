% %%%%%%%%%%%%%%%%%%%%%%%%%%
% function id = tnm034(im)
% %
% % im: Image of unknown face, RGB-image in uint8 format in the
% % range [0,255]
% %
% % id: The identity number (integer) of the identified person,
% % i.e. ?1?, ?2?,?,?16? for the persons belonging to ?db1?
% % and ?0? for all other faces.
% %
% % Your program code.
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %Create Database
% %CreateDatabase();
% load('database');
% 
% DetectedFace = im2double(DetectFace(im));
% meanImage=VecIm;
% if DetectedFace == -1
%    id = 0;
%    return;
% end
% 
% 
% newImage = DetectedFace(:);
% newDiff2 = newImage - meanImage;
% newWeight = transpose(u)*newDiff2;
% weights
% [V,index] = min(sum(sqrt((newWeight-weights).^2)));
% 
% Thresh =2 *10^3;
% if V > Thresh
%      id = 0;
%      return
% end
% 
% id =index;
% 
% 
% end


