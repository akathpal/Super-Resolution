function sr_img = patch_aggregation(patch_img,s)
% s -> patch_size
sr_img = zeros(512,512,'uint8');
 a =0;
for i = 1+s:512-s
    c=0;
    for j = 1+s:512-s
        t = (512-s+3)+c+a;
        r = 0;
        for n = s:-1:1
            k = t;
            for m = s:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k + 1;
            end
            t= t + (512-s+1);
        end
        sr_img(i,j) = r/(s*s);
        c = c+1;
    end
    a = a+(512-s+1);
end
%top_centre
l = 1;
for i = 1:s
    c = 0;
    for j = 1+s:512-s
        t=2+c;
        r=0;
        for n = l:-1:1
            k = t;
            for m = s:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t + (512-s+1);
        end
        sr_img(i,j) = uint8(double(r)/double(s*l)); %no of overlapping patterns
        c = c+1;
    end
    l=l+1;
end
%bottom_centre
l = s;
o = 1;
for i = 512:-1:(512-s+1)
    c = 0;
    for j = 1+s:512-s
        t=2+(512-s)*(512-s+1)+c;
        r=0;
        for n = l:1:s
            k = t;
            for m = s:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t - (512-s+1);
        end
        sr_img(i,j) = uint8(double(r)/double(s*o)); %no of overlapping patterns
        c = c+1;
    end
    l=l-1;
    o = o+1;
end

%left_centre
l = 1;
for j = 1:s
    c = 0;
    for i = 1+s:512-s
        t=1+(512-s+1)+c*(512-s+1);
        r=0;
        for m = l:-1:1
            k = t;
            for n = s:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+(512-s+1);
            end
            t = t + 1;
        end
        sr_img(i,j) = uint8(double(r)/double(s*l)); %no of overlapping patterns
        c = c+1;
    end
    l=l+1;
end

%right_centre
l = s;
o = 1;
for j = 512:-1:(512-s+1)
    c = 0;
    for i = 1+s:512-s
        t=2*(512-s+1)+c;
        r=0;
        for m = l:1:s
            k = t;
            for n = s:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+(512-s+1);
            end
            t = t-1;
        end
        sr_img(i,j) = uint8(double(r)/double(s*o)); %no of overlapping patterns
        c = c+(512-s+1);
    end
    l=l-1;
    o = o+1;
end
%corner_tl
l = 1;
for i = 1:s
    c = 1;
    for j = 1:s
        t=c;
        r=0;
        for n = l:-1:1
            k = t;
            for m = 1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k-1;
            end
            t = t + (512-s+1);
        end
        sr_img(i,j) = uint8(double(r)/double(l*c)); %no of overlapping patterns
        c = c+1;
    end
    l=l+1;
end
%corner_tr
for i = 1:s
    c = s;
    for j = 512:-1:(512-s+1)
        t=(512-(2*s)+1)+c;
        r=0;
        for n = i:-1:1
            k = t;
            for m = s:-1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t + (512-s+1);
        end
        sr_img(i,j) = uint8(double(r)/double(i*(513-j))); %no of overlapping patterns
        c = c-1;
    end
end
%corner_bl
for i = 512:-1:(512-s+1)
    c = 1;
    for j = 1:s
        t=c+(512-s)*(512-s+1);
        r=0;
        for n = (i-(512-s)):s
            k = t;
            for m = 1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k-1;
            end
            t = t - (512-s+1);
        end
        sr_img(i,j) = uint8(double(r)/double(j*(513-i))); %no of overlapping patterns
        c = c+1;
    end
end
%corner_br
for i = 512:-1:(512-s+1)
    c = s;
    for j = 512:-1:(512-s+1)
        t=c-s+(512-s+1)*(512-s+1);
        r=0;
        for n = (i-(512-s)):s
            k = t;
            for m = s:-1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t - (512-s+1);
        end
        sr_img(i,j) = uint8(double(r)/double((513-j)*(513-i))); %no of overlapping patterns
        c = c-1;
    end
end

end