%DECONVWNR Deblur image using Wiener filter.
%   J = DECONVWNR(I,PSF,NSR) deconvolves image I using the Wiener filter
%   algorithm, returning deblurred image J. Image I can be an N-dimensional
%   array. PSF is the point-spread function with which I was convolved. NSR
%   is the noise-to-signal power ratio of the additive noise. NSR can be a
%   scalar or a spectral-domain array of the same size as I. Specifying 0
%   for the NSR is equivalent to creating an ideal inverse filter.
% Parameters:
% InputImg		- input blured image
% OutputImg     - output deblured image
% PSF           - point spread function
% NSR           - noise-to-signal power ratio 
function OutImg = MyDeconvwnr(I,PSF,NSR)

PSF = fftshift(PSF);
H = fft2(PSF);

% Compute the denominator of G in pieces.
denom = abs(H).^2;
denom = denom + NSR;
G = conj(H);
G = G ./ denom;

G = fftshift(G);

tmp = filter2DFreq(I, G);
OutImg = uint8(tmp);

%return;

% Wiener filter impulse response calculation (start)
Delta = zeros(size(I));
Delta(1,1) = 1;
h = filter2DFreq(Delta, G);
%h = fftshift(h);
x = 1:length(I)/2;
figure,
subplot(2,1,1),
plot(x, (PSF(x,1)));
xlim([0 100]);
title('h (PSF)');
subplot(2,1,2),
%plot(x, (abs(h(x,1))));
plot(x, (h(x,1)));
xlim([0 100]);
title('h winener');

figure,
subplot(2,2,1),
imshow(G,[]);
title('G');
subplot(2,2,2),
imshow(abs(G),[]);
title('abs(G)');
% Wiener filter impulse response calculation (stop)
