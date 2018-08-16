% // The Edgetaper() function blurs the edges of image I using weighting array
% // The Edgetaper() function reduces the ringing effect in image deblurring
% // methods that use the discrete Fourier transform, such as Deconvwnr().
% // Parameters:
% // InputImg		- input image
% // OutputImg      - output image
% // gamma          - this parameter effects on window size. gamma = 1 corresponds big edges, gamma = 6 corresponds small edges
% // beta			- this parameter effects on speed of decline of edges. beta = 0.1 corresponds quick decline, beta = 0.5 corresponds slow decline
function OutImg = MyEdgetaperNew(I,gamma, beta)


I = double(I);

[n m] = size(I);
N = length(I);
x1 = -pi:2*pi/n:pi-pi/n;
x2 = -pi:2*pi/m:pi-pi/m;

% w1 = exp(-1/2*(x/sigma).^2)';
% w2 = exp(-1/2*(x/sigma).^2)';

% gamma = sigma;
% beta = 0.5;

%gamma = sigma;
%beta = 0.1;

% w1 = 0.5*(tanh((x+gamma/2)/beta) - tanh((x-gamma/2)/beta))';
% w2 = 0.5*(tanh((x+gamma/2)/beta) - tanh((x-gamma/2)/beta))';

w1 = 0.5*(tanh((x1+gamma/2)/beta) - tanh((x1-gamma/2)/beta))';
w2 = 0.5*(tanh((x2+gamma/2)/beta) - tanh((x2-gamma/2)/beta))';

w = w1*w2';
OutImg = uint8(I.*w);