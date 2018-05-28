function biCub = lineBicubic(biCub, a)
w = zeros(1,4, 'like', biCub);
x = zeros(1,4, 'like', biCub);
y = zeros(1,4, 'like', biCub);
z = zeros(1,4, 'like', biCub);
q=a;
for p=a:2:(size(biCub,1)-a)    

    %find w
    w(1) = biCub(p, q-1);
    w(2) = biCub(p+1, q);
    w(3) = biCub(p, q+1);
    w(4) = biCub(p-1, q);

    %find x
    x(1) = abs(w(4) - biCub(p+1, q-2));
    x(2) = abs(w(3) - biCub(p+2, q-1));
    x(3) = abs(w(2) - biCub(p-1, q+2));
    x(4) = abs(w(1) - biCub(p-2, q+1));

    %find y
    y(1) = abs(w(2) - biCub(p-1, q-2));
    y(2) = abs(w(1) - biCub(p+2, q+1));
    y(3) = abs(w(4) - biCub(p+1, q+2));
    y(4) = abs(w(3) - biCub(p-2, q-1));

    %find z
    z(1) = abs(x(2) - abs(biCub(p-2, q-1) - biCub(p, q-3)));
    z(2) = abs(x(1) - abs(biCub(p+1, q+2) - biCub(p+3, q)));
    z(3) = abs(x(4) - abs(biCub(p, q+3) - biCub(p+2, q+1)));
    z(4) = abs(x(3) - abs(biCub(p-3, q) - biCub(p-1, q-2)));

    biCub(p,q) = floor(findPixel(w, x, y, z));    
end