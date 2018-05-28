function biCub = biLinearDiag(biCub,a,b)

for i=a:2:5
    for j = (b+1):2:(size(biCub,2)-2)
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end

for i=(a+1):2:5
    for j = b:2:(size(biCub,2)-2)
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end

for j=b:2:5
    for i = (a+1):2:(size(biCub,1)-2)
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end

for j=(b+1):2:5
    for i = a:2:(size(biCub,1)-2)
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end