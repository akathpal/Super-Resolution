clc;
clear all;
close all;

% %Patch index testing
% cpy=sortrows(transpose([-0.3,-0.4,0.4,0.5,0.7,0.8,1,0,0.1,0.2;1,2,3,4,5,6,7,8,9,10]),1);
% c = input('c');
% pin = patchIndex(c,cpy);
% display(pin);

%Patch aggregation testing
A = imread('house.ppm');
A = rgb2gray(A);
patches = prac(A,5,5,1);
B = patch_aggregation(patches,5);
error = MSE(A,B);
display(error);
figure(1);imshow(A);
figure(2);imshow(B);

%Nearest neighbourhoor testing
% patch_test = cell(3,1);
% patch_input = cell(508*508,1);
% for j = 1:252*252
%     patch_test{1}{j} = j.*eye(5);   
% end
% for j = 1:124*124
%     patch_test{2}{j} = (2*j).*eye(5); 
% end
% for j = 1:60*60
%     patch_test{3}{j} = (3*j).*eye(5);
% end
% for j = 1:508*508
%     patch_input{j} = j.*eye(5);
% end
% tic
% nn = nearest_neighbour_final(patch_input,patch_test,2);
% toc
