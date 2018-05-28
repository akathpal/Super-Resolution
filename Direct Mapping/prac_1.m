function Patches = prac_1(img,px,py,overlap)
if overlap == 1
    o = px-1;
else 
    o = 1;
end
X=size(img,1);
Y=size(img,2);
np = (ceil((X-4)/o))*(ceil((Y-4)/o)); %no. of patches 
% display(np);
Patches = zeros(px,py,np,'like',img);
a=(px-1)/2;
b=(py-1)/2;
k=1;
for i=a+1:o:X-a
    for j=b+1:o:Y-b
        Patches(1:px,1:py,k) = img(i-a:i+a,j-b:j+b);
        k=k+1;
    end
end

end
%(ceil((X-4)/o))*(ceil((Y-4)/o));