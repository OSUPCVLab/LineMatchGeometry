
% im1=imread('im1.jpg');
% im2=imread('im2.jpg');

[m1 n1]=size(rgb2gray(im1));

Homography=[H(1,1) H(1,2) H(1,3);H(2,1) H(2,2) H(2,3);H(3,1) H(3,2) 1];

T = maketform('projective', Homography');
Trans_im1=imtransform(im1,T,'bilinear','XData',[1 n1],'YData',[1 m1]);

figure,subplot(2,2,1),imshow(im1);Title('\bf{Image 1}','fontsize',10);...
       subplot(2,2,2),imshow(im2);Title('\bf{Image 2}','fontsize',10);...
       subplot(2,2,[4]),imshow(Trans_im1);Title('\bf{Image 1: Tranformed using line-based H}','fontsize',10);
%        subplot(3,2,[5 6]),imshow(Trans_im1);Title('\bf{Image 1: Tranformed using point-based H}','fontsize',10);



Mosaic=(Trans_im1);
ind=find(Trans_im1==0);
Mosaic(ind)=im2(ind);

figure,imshow((Mosaic))