%%%%%%%%%%%%%%%%%%%%%%%%%%
function id = tnm034(im)
%
% im: Image of unknown face, RGB-image in uint8 format in the
% range [0,255]
%
% id: The identity number (integer) of the identified person,
% i.e. ?1?, ?2?,?,?16? for the persons belonging to ?db1?
% and ?0? for all other faces.
%
% Your program code.
%%%%%%%%%%%%%%%%%%%%%%%%%%

%Create Database
%[meanImage,weights,u] = CreateDatabase();

DetectedFace = im2double(DetectFace(im));

% if DetectedFace == -1
%    id = 0;
%    return;
% end
% 
% 
% newImage = DetectedFace(:);
% newDiff2 = newImage - meanImage;
% newWeight = transpose(u)*newDiff2;
% V = weights-newWeight;
% minDiff = sqrt(V*V');
% 
% Trash =3.25 *10^-3;
% if minDiff > Trash
%    id = 0;
%    return
% end
id = 1;

end


