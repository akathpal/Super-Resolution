clc;
clear all;
close all;
img = imread ('IMG_256.bmp');
%img = rgb2gray(img_color);
img_high = imread ('IMG_512.bmp');
%img_high = rgb2gray(img_color_high);
p=2;        % pyramid cross-level scale factor
s=4;        % scale factor
NL=3;        % No of levels
sigma2=1;
X=size(img,1);
Y=size(img,2);
pyramid_yh = cell(NL+1,1); % preallocation of array of variable size
pyramid_yl = cell(NL,1);
Yh = zeros(X,Y,NL+1,'uint8'); 
Yh( :, :,1) = img; 
pyramid_yh{1} = img;

%%%%%%%%% VARIABLES %%%%%%%%%% 
method = 1;%input('Enter the method no. for finding neighbour [1->4neighbours in combined patches 2->3neighbours 3->12neighbours] : ');
itr = 1;%input('Enter the number of iterations : ');
patch_size  = input('Enter patch size : ');
overlap = input('Enter the required overlapping : ');
tic
for n=1:1:NL
    sigma2 = n*sigma2*log(p)/log(s);
    pn= p.^n;
    img_temp = lowpass(img,sigma2);
    Yh(1:X/pn,1:Y/pn,n+1)= downsampling(img_temp,pn);
    pyramid_yh{n+1} = imcrop(Yh(1:X/pn,1:Y/pn,n+1),[0,0,X/pn,Y/pn]); %cropping rectangle from image
    pyramid_yl{n} = bicubicInterpolation(pyramid_yh{n+1});
end

%Storing Patches in a cell
patches_yl = cell(NL,1);
patches_yh = cell(NL,1);

for n=1:NL
    patches_yh{n} = prac(pyramid_yh{n},patch_size,patch_size,overlap);
    patches_yl{n} = prac(pyramid_yl{n},patch_size,patch_size,overlap);
end

%Gradual Upscaling and extracting its patches
up_img = bicubicInterpolation(img);
patch_img = prac(up_img,patch_size,patch_size,overlap); %returns a cell with patches of upscaled image 

if overlap == 1
    o = patch_size-1;
else 
    o = 1;
end

%nearest neighbour search
nn_yl = nearest_neighbour_final(patch_img,patches_yl,method,o);
nn_yh = nearest_neighbour_final(patch_img,patches_yh,method,o);

%computing transformation matrix Mi and finding output patch
final_patch = cell((513-patch_size)*(513-patch_size)/(o*o),1);
% up1_img = imresize(img,2,'bicubic');
% error_up = MSE(up1_img,img_high);
% psnr_up = 10*log10((double(max(up1_img(:)))^2)/error_up);
% display(error_up);
% display(psnr_up);
% figure(1);imshow(img_high);
% figure(2);imshow(up1_img);
error_up = MSE(up_img,img_high);
psnr_up = 10*log10((double(max(up_img(:)))^2)/error_up);
%display(error_up);
%display(psnr_up);
toc
for n = 1 : itr
    lambda = 200;%input('Enter the value of lambda : '); 
    %tic
    for i=1:(513-patch_size)*(513-patch_size)/(o*o)
        T = double(nn_yh{i})*double(transpose(nn_yl{i}));
        P = double(nn_yl{i})*double(transpose(nn_yl{i}));
        M = T/(P+(lambda.*eye(patch_size)));
        final_patch{i} = uint8(M*double(patch_img{i}));  
    end

    %patch aggregation 
    if o == 1
        sr_img = patch_aggregation(final_patch,patch_size);
    else
         sr_img = patch_aggregation_1(final_patch,patch_size,up_img);
    end
    %toc
    error_sr = MSE(sr_img,img_high);
    psnr_sr = 10*log10((double(max(sr_img(:)))^2)/error_sr);
    display(error_sr);
    display(psnr_sr);
    %toc
    %figure(n+2);imshow(sr_img);
end

figure(1);imshow(img_high);
title('standard');
figure(2);imshow(sr_img);
title('sr_img');
img1 = imresize(img,2,'bicubic');
figure(3);imshow(img1);
title('bicubic');
error_bi = MSE(img1,img_high);
psnr_bi = 10*log10((double(max(img1(:)))^2)/error_bi);
display(error_bi);
display(psnr_bi);
