function biCub = straightBicubic(inp)

biCub = zeros(2*size(inp,1), 2*size(inp,2), 'double');
w = zeros(1,4, 'double');
x = zeros(1,4, 'double');
y = zeros(1,4, 'double');
z = zeros(1,4, 'double');

for i=1:1:(size(inp,1))
    for j=1:1:(size(inp,2))
        biCub(((i*2)-1),((j*2)-1)) = inp(i,j);
    end
end

for p=2.5:1:(size(inp)-1.5)
    for q=2.5:1:(size(inp)-1.5)
        %find w
        w(1) = inp(p+0.5, q-0.5);
        w(2) = inp(p+0.5, q+0.5);
        w(3) = inp(p-0.5, q-0.5);
        w(4) = inp(p-0.5, q+0.5);

        %find x
        x(1) = abs(inp(p+1.5, q-0.5) - inp(p-0.5, q-0.5));
        x(2) = abs(inp(p+1.5, q+0.5) - inp(p-0.5, q+0.5));
        x(3) = abs(inp(p+0.5, q+0.5) - inp(p-1.5, q+0.5));
        x(4) = abs(inp(p+0.5, q-0.5) - inp(p-1.5, q-0.5));

        %find y
        y(1) = abs(inp(p+0.5, q-1.5) - inp(p+0.5, q+0.5));
        y(2) = abs(inp(p+0.5, q-0.5) - inp(p+0.5, q+1.5));
        y(3) = abs(inp(p-0.5, q-0.5) - inp(p-0.5, q+1.5));
        y(4) = abs(inp(p-0.5, q-1.5) - inp(p-0.5, q+0.5));

        %find z
        z(1) = abs(x(2) - abs(inp(p+1.5, q-1.5) - inp(p-0.5, q-1.5)));
        z(2) = abs(x(1) - abs(inp(p+1.5, q+1.5) - inp(p-0.5, q+1.5)));
        z(3) = abs(x(4) - abs(inp(p+0.5, q+1.5) - inp(p-1.5, q+1.5)));
        z(4) = abs(x(3) - abs(inp(p-1.5, q-1.5) - inp(p+0.5, q-1.5)));

        biCub(((p*2)-1),((q*2)-1)) = floor(findPixel(w, x, y, z));
    end
end