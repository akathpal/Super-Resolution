function nn_patch = nearest_neighbour(img_patch,pyramid_patch,nn)

nn_patch = cell(nn,1);
index_j = 1;
index_k = 1;
for i = 1:nn
    maximum = corr2(img_patch{i},pyramid_patch{1}{1});
    %display(maximum);
    for j = 1:3
        for k = 1:size(pyramid_patch{j},1)
            r = corr2(img_patch{i},pyramid_patch{j}{k});
            if(r>maximum)
                maximum = r;
                index_j = j;
                index_k = k;
            end
        end
    end
    nn_patch{i} = pyramid_patch{index_j}{index_k};
end

end