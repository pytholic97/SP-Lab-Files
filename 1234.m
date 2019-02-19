clear all;
i= imread('cameraman.tif')
img=im2double(i)
imshow(i)
j= imnoise(i,'gaussian')
figure, imshow(j)
h= ones(3)/9
y= imfilter(i,h)

gx=[[-1,-2,-1];[0,0,0];[1,2,1]]
gy=[[-1,0,1];[-2,0,2];[-1,0,1]]

ex=imfilter(y,gx)
ey=imfilter(y,gy)

figure,imshow(ex)
figure,imshow(ey)

tot=abs(ex)+abs(ey)
maxi=max(max(tot))
norm=tot/maxi
norm=double(norm)

 for p=1:size(img)
    for q=1:size(img)
        if((norm(p,q))<0.1)
           norm(p,q)=0;
       else
           norm(p,q)=1;
        end
    end
 end
 
figure;imshow([y norm])