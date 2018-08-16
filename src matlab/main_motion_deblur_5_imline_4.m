% 2018-07-23
% motion deblur
% LEN specifies the length of the motion and 
% THETA specifies the angle of motion
clc, clear all, close all;

strFolder = 'D:\home\programming\vc\new\6_My home projects\12_Motion_deblur\input\';
strFileName = strcat(strFolder,'P1030513_short_white.png');
%strFileName = strcat(strFolder,'P1030513_short_black.png');

imgA = imread(strFileName);
[h w c] = size(imgA);
if c == 3
    imgA = rgb2gray(imgA);
end

%************
% inputting *
%************
figure,imshow(imgA);
h  = imline();
pos = getPosition(h);
LEN = sqrt((pos(1) - pos(2))^2 + (pos(3) - pos(4))^2)
THETA = 180-atan2d(pos(3) - pos(4), pos(1) - pos(2))
% LEN = 78;
% THETA = 15;
NSR = 1/300;      % NSR is the noise-to-signal power ratio of the additive noise

%************
% debluring *
%************

imgB = MyEdgetaperNew(imgA, 5.0, 0.2);
PSF = fspecial('motion', LEN, THETA);
wnr = deconvwnr(imgB, PSF, NSR);

%************
% outputting
%************

figure,imshow(imgB, []);
figure,imshow(PSF, []);
figure,imshow(wnr, []);

figure, imshowpair(imgA, wnr, 'montage');