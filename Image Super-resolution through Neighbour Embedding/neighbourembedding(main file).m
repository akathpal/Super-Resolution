clc;
clear all;
close all;
Xt  = imread('HOUSE_256.pgm');
image_512 = imread('HOUSE_512.pgm');
%image_512 = rgb2gray(image_512);
%Xt  = rgb2gray(Xt);
Yt = Xt;
figure(1);
imshow(Yt);
imsave
patch_x = 3;
patch_y = 3; 
pn = 2;
sum = zeros(10,10,'double');
%Xs = imresize(Xt,1/pn,'cubic');
Xs = downsampling(Xt,2);
Ys = bicubicinterpolation(Xs);
% figure(2);
% imshow(Xs);
% figure(3);
% imshow(Ys);
Xs_patch = prac(Xs);
Ys_patch = prac1(Ys);
Ys_patch = Ys_patch(1:length(Xs_patch));
Xt_patch = prac(Xt);
%Xt_ext = extrapolate(Xt);
%Xs_ext = extrapolate(Xs);
identity = eye(5);
%identity_ext = identity_extrapolate(identity);

%  f1 = features(Xt_ext);
%  f1 = f1(3:size(Xt_ext,1)-2,3:size(Xt_ext,2)-2);
%  
%  f2 = features(Xs_ext);
%  f2 = f2(3:size(Xs_ext,1)-2,3:size(Xs_ext,2)-2);
%  
%  f3 = features(identity_ext);
%  f3 = f3(3:size(identity_ext,1)-2,3:size(identity_ext,2)-2);
% 
% f1_patch = prac(f1);
% f2_patch = prac(f2);


dist = zeros(size(Xs_patch),2,'double');
high_patch = cell(5,1);
low_patch = cell(5,1);
Yt_patch  = cell(size(Xt_patch,1),1);
yt_patch_array  = zeros(10,10,size(Xt_patch,1),'uint8');

    for j = 1:1:size(Xs_patch,1) 
        dist(j,1) = euclid(identity,Xs_patch{j});
        dist(j,2) = j;
    end
    dist = sortrows(dist,1);

 for i =1:1:size(Xt_patch,1);
     
     dist_Xt = euclid(identity,Xt_patch{i});
     neighbour = patchIndex5(dist_Xt,dist);
 
     for k=1:1:5
         high_patch{k,1} = Ys_patch{neighbour(k),1};
         low_patch{k,1} = Xs_patch{neighbour(k),1};
     end
    
     weight = weight_new(Xt_patch{i,1},low_patch);
     weight = weight';
%     weight = weights(Xt_patch{i,1},low_patch);
%     
    for k=1:1:length(weight)
        temp = double(high_patch{k,1});
        sum = sum + weight(k)*temp;
    end
            sum = uint8(floor(sum));
            Yt_patch{i,1} = sum; 
            sum = 0;
            
 end
 
 for i=1:1:size(Xt_patch,1)
      yt_patch_array(:,:,i) = Yt_patch{i,1};
 end

 Yt_image = patch_aggregation_8(yt_patch_array,image_512);
 figure(2);
 imshow(Yt_image);
 imsave;
 error = MSE(image_512(10:507,10:507),Yt_image(10:507,10:507));
 psnr_sr = 10*log10((double(max(Yt_image(:)))^2)/error);
 figure(3);
 imshow(bicubicinterpolation(Yt));
 
 
 

    

