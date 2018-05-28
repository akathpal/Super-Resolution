function Yt = identity_extrapolate(Xt)
x1 = zeros(size(Xt,1),2,'uint8');
y1 = zeros(2,size(Xt,2)+4,'uint8');
Xt = horzcat(x1,Xt);
Xt = horzcat(Xt,x1);
Xt = vertcat(y1,Xt);
Xt = vertcat(Xt,y1);

X = size(Xt,1);
Y = size(Xt,2);

a = [1,0;0,1];
b = [0,0;0,0];

Xt(1:2,1:2) = a;
Xt(1:2,Y-1:Y) = b;
Xt(X-1:X,1:2) = b;
Xt(X-1:X,Y-1:Y) = a;

Yt = Xt;
end
