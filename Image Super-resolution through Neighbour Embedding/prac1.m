function Patches = prac1(img)

X=size(img,1);
Y=size(img,2);

patch_size_x = 10;
patch_size_y = 10;

np = (X-9)*(Y-9);
Patches = cell(np,1);
k=1;
for i=1:2:X-9
    for j=1:2:Y-9
        Patches{k} = img(i:i+9,j:j+9);
        k=k+1;
    end
end
end
        