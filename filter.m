m= imread('cameraman.tif')
subplot(2,2,1)
imshow(m)
j= imnoise(m,'gaussian')
subplot(2,2,2)
imshow(j)
h= ones(3)/9
y= imfilter(j,h)
subplot(2,2,3)
imshow(y)