function Patches = prac(img,patch_size_x,patch_size_y,overlap)
if overlap == 1
    o = patch_size_x-1;
else 
    o = 1;
end
X=size(img,1);
Y=size(img,2);
%np = (ceil((X-4)/o))*(ceil((Y-4)/o)); %no. of patches
np = (X-4)*(Y-4)/(o*o); %no. of patches
Patches = cell(np,1);
a=(patch_size_x-1)/2;
b=(patch_size_y-1)/2;
k=1;
for i=a+1:o:X-a
    for j=b+1:o:Y-b
        Patches{k} = img(i-a:i+a,j-b:j+b);
        k=k+1;
    end
end

end
      

