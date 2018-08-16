% filter2DFreq filters an image by H transfer function of filter

function OutputImg = filter2DFreq(InputImg, H)

imgA_fft = fft2(InputImg);
imgB = ifftshift(H);
imgC = ifft2(imgA_fft .* imgB);
disp(max(max(abs(real(imgC)))));
disp(max(max(abs(imag(imgC)))));
OutputImg = real(imgC);

end