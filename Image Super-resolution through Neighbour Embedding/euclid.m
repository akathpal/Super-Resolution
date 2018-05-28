function dist = euclid(x1,x2)

X = size(x1,1);
Y = size(x1,2);

distance = zeros(X,Y,'double');
c = 0;

for i=1:1:X
    for j=1:1:Y
        a = double(x1);
        b = double(x2);
        %for k=1:1:length(a)
            c = c + (a(i,j) - b(i,j)).^2;
        %end
    end
end
         %distance(i,j) = sqrt(c);
         dist = sqrt(c);
         c=0;
        
    %end
%dist = sum((sum(distance))');
end


 