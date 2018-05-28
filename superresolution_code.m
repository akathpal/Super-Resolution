clc;
clear all;
close all;
img_color = imread ('lena_256.ppm');
img = rgb2gray(img_color);
img_color_high = imread ('lena_512.ppm');
img_high = rgb2gray(img_color_high);
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
method = input('Enter the method no. for finding neighbour [1->4neighbours in combined patches 2->3neighbours 3->12neighbours] : ');
itr = input('Enter the number of iterations : ');
%1->4neighbours in combined patches
%2->3neighbours
%3->12neighbours
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
    patches_yh{n} = prac(pyramid_yh{n});
    patches_yl{n} = prac(pyramid_yl{n});
end

%Gradual Upscaling and extracting its patches
up_img = bicubicInterpolation(img);
patch_img = prac(up_img); %returns a cell with patches of upscaled image 

%nearest neighbour search
nn_yl = nearest_neighbour_final(patch_img,patches_yl,method);
nn_yh = nearest_neighbour_final(patch_img,patches_yh,method);

%computing transformation matrix Mi and finding output patch
final_patch = cell(508*508,1);
error_up = MSE(up_img,img_high);
psnr_up = 10*log10((double(max(up_img(:)))^2)/error_up);
display(error_up);
display(psnr_up);
toc
for n = 1 : itr
    lambda = input('Enter the value of lambda : '); %3350,6
    tic
    for i=1:508*508
        T = double(nn_yh{i})*double(transpose(nn_yl{i}));
        P = double(nn_yl{i})*double(transpose(nn_yl{i}));
        M = T/(P+(lambda.*eye(5)));
        final_patch{i} = uint8(M*double(patch_img{i}));  
    end

    %patch aggregation
    sr_img = patch_aggregation(final_patch);
    %toc
    error_sr = MSE(sr_img,img_high);
    psnr_sr = 10*log10((double(max(sr_img(:)))^2)/error_sr);
    display(error_sr);
    display(psnr_sr);
    toc
    figure(n);imshow(sr_img);
end

 
