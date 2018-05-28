function biCub = biLinearReverse(biCub,a,b)

i=a;
for j = b:-2:4
    biCub(i,j) = floor((biCub(i-1,j-1) + biCub(i+1,j-1) + biCub(i-1,j+1) + biCub(i+1,j+1))/4);
end

j=b;
for i = a-2:-2:4
    biCub(i,j) = floor((biCub(i-1,j-1) + biCub(i+1,j-1) + biCub(i-1,j+1) + biCub(i+1,j+1))/4);
end