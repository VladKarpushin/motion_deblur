% 2018-07-23
% motion deblur
% LEN specifies the length of the motion and 
% THETA specifies the angle of motion
clc, clear all, close all;

strFolder = 'D:\home\programming\vc\new\6_My home projects\12_Motion_deblur\input\';
%strFileName = strcat(strFolder,'P1030513.JPG');
strFileName = strcat(strFolder,'P1030513_short_white.png');
%strFileName = strcat(strFolder,'P1030523.JPG');

imgA = imread(strFileName);
[h w c] = size(imgA);
if c == 3
    imgA = rgb2gray(imgA);
end


%************
% inputting *
%************

figure,imshow(imgA);
%h  = imdistline();
%h = imrect();
h  = imline();
pos = getPosition(h);
LEN = sqrt((pos(1) - pos(2))^2 + (pos(3) - pos(4))^2)
THETA = 180-atan2d(pos(3) - pos(4), pos(1) - pos(2))
% LEN = getDistance(h);
% THETA = getAngleFromHorizontal(h);

% LEN = 78;
% THETA = 12;

%************
% debluring *
%************
NSR = 1/100;      % NSR is the noise-to-signal power ratio of the additive noise

imgB = MyEdgetaperNew(imgA, 5.0, 0.2);

% for P1030470.JPG
% LEN = 165;
% THETA = 13;

% for P1030476.JPG
% LEN = 58;
% THETA = 9.57;

% for P1030510.JPG
% LEN = 62;
% THETA = 2.2;

% !!!!for P1030513.JPG
% LEN = 78;
% THETA = 12;
%LEN = 80;
%THETA = 14;
% LEN = 78.3;
% THETA = 11.8;

% for P1030515.JPG
%LEN = 52;
%THETA = 2.6;

% LEN =  53.35;
% THETA =0;



PSF = fspecial('motion', LEN, THETA);
%PSF = fspecial('disk', 53);
wnr = deconvwnr(imgB, PSF, NSR);


% tic
% wnrMy   = MyDeconvwnr(blurred_noisy, PSF, NSR);
% toc

figure,imshow(imgB, []);
figure,imshow(PSF, []);
figure,imshow(wnr, []);

% figure, 
% subplot(2,2,1);
% imshow(imgA, []);
% title('img');
% subplot(2,2,2);
% imshow(imgB, []);
% title('img after edgetaper');
% subplot(2,2,3);
% imshow(PSF, []);
% title('PSF');
% subplot(2,2,4);
% imshow(wnr, []);
% title('deblured by Wiener filter wnr');