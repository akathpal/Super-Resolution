function nn_patch = nearest_neighbour_final(img_patch,pyramid_patch,method,o)

%correlation of upscaled image
s = size(img_patch{1},1);
corr_img = zeros((513-s)*(513-s)/(o*o),2,'double');
k=1;
for i=1:(513-s)*(513-s)/(o*o)
        corr_img(k,1) = norm(double(img_patch{k})-double(eye(s)));
        corr_img(k,2)=i;
        k=k+1;
end

%correlation of pyramid
%% METHOD 1 %%%
if method == 1
    l = (257-s)*(257-s)/(o*o) + (129-s)*(129-s)/(o*o) + (65-s)*(65-s)/(o*o);
    corr_pyramid = zeros(l,2,'double');
    patches = vertcat(pyramid_patch{1},pyramid_patch{2},pyramid_patch{3});
    k=1;
    for j = 1:l
        corr_pyramid(k,1) = norm(double(img_patch{j})-double(eye(s)));
        corr_pyramid(k,2) = j;
        k = k+1;
    end
    corr_pyramid = sortrows(corr_pyramid,1);

    nn_patch = cell((513-s)*(513-s)/(o*o),1);

    for i = 1:(513-s)*(513-s)/(o*o)
        p1 = patchIndex_12(corr_img(i,1),corr_pyramid);
        %nn_patch{i} = horzcat(patches{p1(1)},patches{p1(2)},patches{p1(3)},patches{p1(4)});
        nn_patch{i} = horzcat(patches{p1(1)},patches{p1(2)},patches{p1(3)},patches{p1(4)},patches{p1(5)},patches{p1(6)},patches{p1(7)},patches{p1(8)},patches{p1(9)},patches{p1(10)},patches{p1(11)},patches{p1(12)});
    end

%%% METHOD 2 and METHOD 3 %%%
elseif method == 2 || method == 3
    corr_pyramid_1 = zeros(252*252/(o*o),2,'double');
    corr_pyramid_2 = zeros(124*124/(o*o),2,'double');
    corr_pyramid_3 = zeros(60*60/(o*o),2,'double');

    k=1;
    for j = 1:252*252/(o*o)
        corr_pyramid_1(k,1) = norm(double(pyramid_patch{1}{j})-double(eye(5)));
        corr_pyramid_1(k,2) = j;
        k = k+1;
    end
    k=1;
    for j = 1:124*124/(o*o)
        corr_pyramid_2(k,1) = norm(double(pyramid_patch{2}{j})-double(eye(5)));
        corr_pyramid_2(k,2) = j;
        k = k+1;
    end
    k=1;
    for j = 1:60*60/(o*o)
        corr_pyramid_3(k,1) = norm(double(pyramid_patch{3}{j})-double(eye(5)));
        corr_pyramid_3(k,2) =j;
        k = k+1;
    end

    corr_pyramid_1 = sortrows(corr_pyramid_1,1);
    corr_pyramid_2 = sortrows(corr_pyramid_2,1);
    corr_pyramid_3 = sortrows(corr_pyramid_3,1);

    nn_patch = cell(508*508/(o*o),1);

    for i = 1:508*508/(o*o)
        if method == 3
            p1 = patchIndex_4(corr_img(i,1),corr_pyramid_1);
            p2 = patchIndex_4(corr_img(i,1),corr_pyramid_2);
            p3 = patchIndex_4(corr_img(i,1),corr_pyramid_3);  
            nn_patch{i} = horzcat(pyramid_patch{1}{p1(1)},pyramid_patch{1}{p1(2)},pyramid_patch{1}{p1(3)},pyramid_patch{1}{p1(4)},pyramid_patch{2}{p2(1)},pyramid_patch{2}{p2(2)},pyramid_patch{2}{p2(3)},pyramid_patch{2}{p2(4)},pyramid_patch{3}{p3(1)},pyramid_patch{3}{p3(2)},pyramid_patch{3}{p3(3)},pyramid_patch{3}{p3(4)});
        elseif method == 2
            p1 = patchIndex(corr_img(i,1),corr_pyramid_1);
            p2 = patchIndex(corr_img(i,1),corr_pyramid_2);
            p3 = patchIndex(corr_img(i,1),corr_pyramid_3);
            nn_patch{i} = horzcat(pyramid_patch{1}{p1},pyramid_patch{2}{p2},pyramid_patch{3}{p3});
        end
    end

end

end