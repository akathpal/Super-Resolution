function sr_img = patch_aggregation(patch_img)

sr_img = zeros(512,512,'uint8');
 a =0;
for i = 6:507
    c=0;
    for j = 6:507
        t = 510+c+a;
        r = 0;
        for n = 5:-1:1
            k = t;
            for m = 5:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k + 1;
            end
            t= t + 508;
        end
        sr_img(i,j) = r/25;
        c = c+1;
    end
    a = a+508;
end
%top_centre
l = 1;
for i = 1:5
    c = 0;
    for j = 6:507
        t=2+c;
        r=0;
        for n = l:-1:1
            k = t;
            for m = 5:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t + 508;
        end
        sr_img(i,j) = uint8(double(r)/double(5*l)); %no of overlapping patterns
        c = c+1;
    end
    l=l+1;
end
%bottom_centre
l = 5;
o = 1;
for i = 512:-1:508
    c = 0;
    for j = 6:507
        t=2+507*508+c;
        r=0;
        for n = l:1:5
            k = t;
            for m = 5:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t - 508;
        end
        sr_img(i,j) = uint8(double(r)/double(5*o)); %no of overlapping patterns
        c = c+1;
    end
    l=l-1;
    o = o+1;
end

%left_centre
l = 1;
for j = 1:5
    c = 0;
    for i = 6:507
        t=1+508+c*508;
        r=0;
        for m = l:-1:1
            k = t;
            for n = 5:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+508;
            end
            t = t + 1;
        end
        sr_img(i,j) = uint8(double(r)/double(5*l)); %no of overlapping patterns
        c = c+1;
    end
    l=l+1;
end

%right_centre
l = 5;
o = 1;
for j = 512:-1:508
    c = 0;
    for i = 6:507
        t=2*508+c;
        r=0;
        for m = l:1:5
            k = t;
            for n = 5:-1:1
                r = double(r) + double(patch_img{k}(n,m));
                k = k+508;
            end
            t = t-1;
        end
        sr_img(i,j) = uint8(double(r)/double(5*o)); %no of overlapping patterns
        c = c+508;
    end
    l=l-1;
    o = o+1;
end
%corner_tl
l = 1;
for i = 1:5
    c = 1;
    for j = 1:5
        t=c;
        r=0;
        for n = l:-1:1
            k = t;
            for m = 1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k-1;
            end
            t = t + 508;
        end
        sr_img(i,j) = uint8(double(r)/double(l*c)); %no of overlapping patterns
        c = c+1;
    end
    l=l+1;
end
%corner_tr
for i = 1:5
    c = 5;
    for j = 512:-1:508
        t=503+c;
        r=0;
        for n = i:-1:1
            k = t;
            for m = 5:-1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t + 508;
        end
        sr_img(i,j) = uint8(double(r)/double(i*(513-j))); %no of overlapping patterns
        c = c-1;
    end
end
%corner_bl
for i = 512:-1:508
    c = 1;
    for j = 1:5
        t=c+507*508;
        r=0;
        for n = (i-507):5
            k = t;
            for m = 1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k-1;
            end
            t = t - 508;
        end
        sr_img(i,j) = uint8(double(r)/double(j*(513-i))); %no of overlapping patterns
        c = c+1;
    end
end
%corner_br
for i = 512:-1:508
    c = 5;
    for j = 512:-1:508
        t=c-5+508*508;
        r=0;
        for n = (i-507):5
            k = t;
            for m = 5:-1:c
                r = double(r) + double(patch_img{k}(n,m));
                k = k+1;
            end
            t = t - 508;
        end
        sr_img(i,j) = uint8(double(r)/double((513-j)*(513-i))); %no of overlapping patterns
        c = c-1;
    end
end

end