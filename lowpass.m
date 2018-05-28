function img1 = lowpass(image,sigma2)

X=size(image,1);
Y=size(image,2);
% gaussian matrix 3*3 
[X1 Y1]=meshgrid(-1:1,-1:1);
h=exp(-1*(X1.^2 + Y1.^2)/(2*sigma2))/(2*pi*sigma2);
temp=0;
m=size(h,1);
n=size(h,2);
a=(m-1)/2;
b=(n-1)/2;
img1=zeros(X,Y,'uint8');

for x=1:1:X
    for y=1:1:Y
        for i=-a:1:a
            for j=-b:1:b
                if (x+i == 0) || (y+j == 0) || (x+i > X) || (y+j > Y)
                    continue;
                else
                    temp = temp + (h(i+a+1,j+b+1)*image(x+i,y+j))/sum(sum(h));
                end
            end
       end
        img1(x,y)=floor(temp);
        temp=0;
    end
end
%img=downsample(downsample(img1,2).',2).';
end
        


%G = fspecial('gaussian', [3 3], 2);
%Blur Image
%blurredImage = imfilter(img,G,'same');
%subplot(2,2,4);
%imshow(blurredImage);



