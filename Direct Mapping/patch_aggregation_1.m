function sr_img = patch_aggregation_1( patches, s, img)
%s is size
o = s-1;
img_x = size(img,1);
img_y = size(img,2);
ny = ceil((img_y - 4)/o); %no. of patches in y direction
np = (ceil((img_x-4)/o)*ny); %no. of patches 
sr_img = zeros( img_x, img_y, 'like', img);

for n = 1:np
    rmd = rem(n,ny);
    if(rmd == 0)
        x = 1 + (4 * (floor(n/ny)-1));
        y = 1 + (4 * (ny-1));
    else
        x = 1 + (4 * floor(n/ny));
        y = 1 + (4 * (rmd-1));
    end
    p=0;
    q=0;
    for a = x:(x+4)
        p=p+1;
        q=0;
        for b = y:(y+4)
            q=q+1;
            ca = rem((a-5),o);
            cb = rem((b-5),o);
            
            a_bnd=0;
            b_bnd=0;
            if(a==1 || a==img_x)
                a_bnd=1;
            end
            if(b==1 || b==img_y)
                b_bnd=1;
            end
            
            if(ca==0 && cb==0)
                if(a_bnd==0 && b_bnd==0)
                    sr_img(a,b) = sr_img(a,b) + (0.25*patches{n}(p,q));
                elseif(a_bnd==1 && b_bnd==1)
                    sr_img(a,b) = sr_img(a,b) + patches{n}(p,q);
                else
                    sr_img(a,b) = sr_img(a,b) + (0.5*patches{n}(p,q));
                end
            elseif(ca==0 || cb==0)
                if(a_bnd==0 && b_bnd==0)
                    sr_img(a,b) = sr_img(a,b) + (0.5*patches{n}(p,q));
                else
                    sr_img(a,b) = sr_img(a,b) + patches{n}(p,q);
                end                  
            else
                sr_img(a,b) = sr_img(a,b) + patches{n}(p,q);
            end
        end
    end
    
end
end