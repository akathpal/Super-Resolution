clc;
clear all;
close all;
tic
%check blurring whether it is needed or not
lambda = input('Enter the value of lambda : ');
%a = input('Enter the value of a : ');    
%b = input('Enter the value of b : '); 

%%%%   FOR GRAYSCALE IMAGE   %%%%
%for lambda = a:5:b
img_color = imread ('lena_256.ppm');
img = rgb2gray(img_color);
img_color_high = imread ('lena_512.ppm');
img_high = rgb2gray(img_color_high);
sr_img = superresolution(img,lambda);

error_sr = MSE(sr_img(6:507,6:507),img_high(6:507,6:507));
psnr_sr = 10*log(255*255/error_sr)/log(10);
%display(lambda);
display(error_sr);
display(psnr_sr);
%end

up_img = bicubicInterpolation(img);
error_up = MSE(up_img(6:507,6:507),img_high(6:507,6:507));
psnr_up = 10*log10((255^2)/(error_up));
display(error_up);
display(psnr_up); 
%38.2321
up_mat_img = imresize(img,2,'bicubic');
error_up_mat = MSE(up_mat_img(6:507,6:507),img_high(6:507,6:507));
psnr_up_mat = 10*log10((255^2)/(error_up_mat));
display(psnr_up_mat);
%35.8089
% figure(4);imshow(up_mat_img(6:507,6:507));
% figure(3);imshow(up_img(6:507,6:507));
 figure(2);imshow(sr_img(6:507,6:507));
% figure(1);imshow(img_high(6:507,6:507));



% %%%%   FOR COLOR IMAGE   %%%%
% img = imread ('lena_256.ppm');
% img_high = imread ('lena_512.ppm');
% R_img = img(:,:,1);
% G_img = img(:,:,2);
% B_img = img(:,:,3);
% R_up_img = bicubicInterpolation(R_img);
% G_up_img = bicubicInterpolation(G_img);
% B_up_img = bicubicInterpolation(B_img);
% up_img = cat(3,R_up_img,G_up_img,B_up_img);
% R_sr_img = superresolution(R_img,lambda);
% G_sr_img = superresolution(G_img,lambda);
% B_sr_img = superresolution(B_img,lambda);
% up_mat_img = imresize(img,2,'bicubic');
% sr_img = cat(3,R_sr_img,G_sr_img,B_sr_img);
% 
% error_sr = MSE(sr_img(6:507,6:507,:),img_high(6:507,6:507,:));
% psnr_sr = 10*log10((255^2)/(error_sr));
% display(psnr_sr);
% error_up = MSE(up_img(6:507,6:507,:),img_high(6:507,6:507,:));
% psnr_up = 10*log10((255^2)/(error_up));
% display(psnr_up);
% error_up_mat = MSE(up_mat_img(6:507,6:507,:),img_high(6:507,6:507,:));
% psnr_up_mat = 10*log10((255^2)/(error_up_mat));
% display(psnr_up_mat);
% 
% figure(4);imshow(up_mat_img(6:507,6:507,:));
% figure(3);imshow(up_img(6:507,6:507,:));
% figure(2);imshow(sr_img(6:507,6:507,:));
% figure(1);imshow(img_high(6:507,6:507,:));

toc
