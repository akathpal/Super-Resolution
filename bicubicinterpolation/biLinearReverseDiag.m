function biCub = biLinearReverseDiag(biCub,a,b)

% for i=a:-1:a-3
%     for j = b-1:-2:5
%         biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
%     end
% end
% 
% for j=b:-1:b-3
%     for i = a-1:-2:5
%         biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
%     end
% end

for i=a:-2:a-3
    for j = (b-1):-2:5
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end

for i=(a-1):-2:a-3
    for j = b:-2:5
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end

for j=b:-2:b-3
    for i = (a-1):-2:5
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end

for j=(b-1):-2:b-3
    for i = a:-2:5
        biCub(i,j) = floor((biCub(i,j-1) + biCub(i,j+1) + biCub(i-1,j) + biCub(i+1,j))/4);
    end
end