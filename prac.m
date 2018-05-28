function Patches = prac(img)

X=size(img,1);
Y=size(img,2);
patch_size_x=5;
patch_size_y=5;
np = (X-4)*(Y-4); %no. of patches
Patches = cell(np,1);
a=(patch_size_x-1)/2;
b=(patch_size_y-1)/2;
k=1;
for i=a+1:1:X-2
    for j=b+1:1:Y-2
        Patches{k} = img(i-a:i+a,j-b:j+b);
        k=k+1;
    end
end

end
      

