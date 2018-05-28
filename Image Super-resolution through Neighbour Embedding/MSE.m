function error = MSE(img1,img2)
    D = abs(double(img1)-double(img2)).^2;
    error = sum(D(:))/numel(img1);
end