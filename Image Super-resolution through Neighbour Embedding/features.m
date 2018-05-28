function feature = features(img)

X = size(img,1);
Y = size(img,2);

img1 = double(img);


feature = cell(X,Y);

for i = 3:1:X-2
    for j = 3:1:Y-2
        dely = img1(i,j+1) - img1(i,j-1);
        delx = img1(i+1,j) - img1(i-1,j);
        del2y = img1(i,j+2) - 2*img1(i,j) + img1(i,j-2);
        del2x = img1(i+2,j) - 2*img1(i,j) + img1(i-2,j);
        feature{i,j}  = horzcat(dely,delx,del2y,del2x);
    end   
end
end
        
        