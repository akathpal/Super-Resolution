% clc;
% clear all;
% close all;
% img=imread('cameraman.tif');
function img2 = downsampling(image,pn)

%img2 = downsample(downsample(image,pn).',pn).';
img2 = imresize(image,1/pn,'cubic');
% temp=0;
% a=1;b=1;
% for i=1:1:size(image,1)
%     b=1;
%     for j=1:1:size(image,2)/pn
%         for k=1:1:pn
%             temp=temp + image(i,(j-1)*pn+k)/pn;
%         end
%         img1(a,b)=temp;
%         temp=0;
%         b=b+1;
%     end
%     a=a+1;
% end
% temp=0;
% a=1;b=1;
% for j=1:1:size(img1,2)
%     a=1;
%     for i=1:1:size(image,1)/pn
%         for k=1:1:pn
%             temp = temp + img1((i-1)*pn+k,j)/pn;
%         end
%         img2(a,b)=temp;
%         temp=0;
%         a=a+1;
%     end
%     b=b+1;
% end

end