clear all;
i= imread('cameraman.tif')
img=im2double(i)
imshow(i)
j= imnoise(i,'gaussian')
figure, imshow(j)
h= ones(3)/9
y= imfilter(i,h)
qw=im2double(y)

gx=[[-1,-2,-1];[0,0,0];[1,2,1]]
gy=[[-1,0,1];[-2,0,2];[-1,0,1]]

ex=imfilter(qw,gx)
ey=imfilter(qw,gy)

figure,imshow(ex)
figure,imshow(ey)

tot=abs(ex)+abs(ey)
maxi=max(max(tot))
norm=tot/maxi
norm=double(norm)

 for p=1:size(img)
    for q=1:size(img)
        if((norm(p,q))<0.35)
           norm(p,q)=0;
       else
           norm(p,q)=255;
        end
    end
 end
 
figure;imshow([y norm])