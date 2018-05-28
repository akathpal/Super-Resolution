function biCub = bicubicInterpolation(inp)

biCub = straightBicubic(inp);

biCub = diagonalBicubic(biCub,6,7);
biCub = diagonalBicubic(biCub,7,6);

biCub = biLinear(biCub,2,2);
biCub = biLinearReverse(biCub,size(biCub,1)-2,size(biCub,2)-2);

biCub = biLinearDiag(biCub,2,2);
biCub = biLinearReverseDiag(biCub,size(biCub,1)-2,size(biCub,2)-2);

biCub = lineAvg_X(biCub);
biCub = lineAvg_Y(biCub);
biCub = uint8(biCub);

end