function biCub = lineAvg_Y(biCub)

i=1;
for j = 2:2:size(biCub,2)-2
    biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1))/2);
end

i=size(biCub,1)-1;
for j = 2:2:size(biCub,2)-2
    biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1))/2);
end

i=size(biCub,1);
for j = 1:1:size(biCub,2)
    biCub(i,j) = biCub(i-1,j);
end