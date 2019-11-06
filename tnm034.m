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
VecIn =[40, 20];

%Change lightning illumination

%Change Color space to most accurate one (YCbCr)
YCBR = rgb2ycbcr(im);
Y = YCBR(:,:,1);
Cb = YCBR(:,:,2);
Cr = YCBR(:,:,3);

Translation(YCBR,VecIn);

id = 0;
