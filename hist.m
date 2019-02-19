m = imread('cameraman.tif')
subplot(3,3,1)
imshow(m)
 l= m+50
subplot(3,3,2)
imshow(l)
k=255-m
subplot(3,3,3)
imshow(k)
subplot(3,3,4)
imhist(m)
subplot(3,3,5)
imhist(l)
subplot(3,3,6)
imhist(k)
subplot(3,3,7)
a=histeq(m)
subplot(3,3,8)
imhist(a)


