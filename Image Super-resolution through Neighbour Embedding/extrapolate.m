function img = extrapolate (Xt)
x1 = zeros(size(Xt,1),2,'uint8');
y1 = zeros(2,size(Xt,2)+4,'uint8');
Xt = horzcat(x1,Xt);
Xt = horzcat(Xt,x1);
Xt = vertcat(y1,Xt);
Xt = vertcat(Xt,y1);

X = size(Xt,1);
Y = size(Xt,2);

for i=3:1:X-2
    for j=1:1:2
        Xt(i,j) = Xt(i,3);
    end
    for j=Y-1:1:Y
        Xt(i,j) = Xt(i,Y-2);
    end
end

for j=3:1:X-2
    for i=1:1:2
        Xt(i,j) = Xt(3,j);
    end
    for i=X-1:1:X
        Xt(i,j) = Xt(X-2,j);
    end
end

Xt(1:2,1:2) = Xt(3,3);
Xt(1:2,Y-1:Y) = Xt(3,Y-2);
Xt(X-1:X,1:2) = Xt(X-2,3);
Xt(X-1:X,Y-1:Y) = Xt(X-2,Y-2);

img = Xt;
end