Motion Deblur Filter
==========================

Goal
----

In this tutorial you will learn:

-   what the PSF of a motion blur image is
-   how to restore a motion blur image

Theory
------

For the degradation image model theory and the Wiener filter theory you can refer to the tutorial @ref tutorial_out_of_focus_deblur_filter "Out-of-focus Deblur Filter".
On this page only a linear motion blur distortion is considered. The motion blur image on this page is a real world image. The blur was caused by a moving subject.

### What is the PSF of a motion blur image?

The point spread function (PSF) of a linear motion blur distortion is a line segment. Such a PSF is specified by two parameters: LEN is the length of the blur and THETA is 
the angle of motion.

![Point spread function of a linear motion blur distortion](/www/images/motion_psf.png)

### How to restore a blurred image?

On this page the Wiener filter is used as the restoration filter, for details you can refer to the tutorial @ref tutorial_out_of_focus_deblur_filter "Out-of-focus Deblur Filter". 
In order to synthesize the Wiener filter for a motion blur case, it needs to specify the signal-to-noise ratio (SNR), LEN and THETA of the PSF.

Result
------

Below you can see the real world image with motion blur distortion. The license plate is not readable on both cars. The red markers show the car’s license plate location.
![Motion blur image. The license plates are not readable](/www/images/motion_original.jpg)


Below you can see the restoration result for the black car license plate. The result was completed by LEN = 125, THETA = 0, SNR = 700.
![The restored image of the black car license plate](/www/images/black_car.jpg)

Below you can see the restoration result for the white car license plate. The result was completed by LEN = 78, THETA = 15, SNR = 300.
![The restored image of the white car license plate](/www/images/white_car.jpg)

The values of SNR, LEN and THETA were selected manually to give the best possible visual result. The THETA parameter coincides with the car’s moving direction, and the 
LEN parameter depends on the car’s moving speed. 
Sure, the result is not perfect, but at least it gives us a hint as to the image’s content. With some difficulty, the car license plate is now readable.

@note The parameters LEN and THETA are the most important. You should adjust LEN and THETA first, then SNR.

You can also find a quick video demonstration of a license plate recovering method
[YouTube](https://youtu.be/xSrE0hdhb4o)
