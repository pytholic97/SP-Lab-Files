clc;
clear all;
close all;
i= imread('cameraman.tif')
img=im2double(i)
imshow(i)


gx=[[-1,-2,-1];[0,0,0];[1,2,1]]
gy=[[-1,0,1];[-2,0,2];[-1,0,1]]

ex=imfilter(img,gx)
ey=imfilter(img,gy)

figure,imshow(ex)
figure,imshow(ey)

tot=abs(ex)+abs(ey)
maxi=max(max(tot))
norm=tot/maxi


 for p=1:size(img)
    for q=1:size(img)
        if((norm(p,q))<0.5)
           norm(p,q)=0;
       else
           norm(p,q)=255;
        end
    end
 end
 
figure;imshow([i norm])