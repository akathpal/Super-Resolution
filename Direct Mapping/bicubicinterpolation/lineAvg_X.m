function biCub = lineAvg_X(biCub)

j=1;
for i = 2:2:size(biCub,1)-2
    biCub(i,j) = floor((biCub(i-1,j) + biCub(i+1,j))/2);
end

j=size(biCub,2)-1;
for i = 2:2:size(biCub,1)-2
    biCub(i,j) = floor((biCub(i-1,j) + biCub(i+1,j))/2);
end

j=size(biCub,2);
for i = 1:1:size(biCub,1)
    biCub(i,j) = biCub(i,j-1);
end