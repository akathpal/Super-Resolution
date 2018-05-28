function sr_img = patch_aggregation_8( patches, img)
patches = double(patches);
o = 2; %o is gap
img_x = size(img,1);
img_y = size(img,2);
ny = ceil((img_y - 8)/o); %no. of patches in y direction
np = (ceil((img_x - 8)/o)*ny); %no. of patches 
sr_img = zeros( img_x, img_y, 'double');
for n = 1:np
    rmd = rem(n,ny);    
    if(rmd == 0)
        x = 1 + (2 * (floor(n/ny)-1));
        y = 1 + (2 * (ny-1));
    else
        x = 1 + (2 * floor(n/ny));
        y = 1 + (2 * (rmd-1));
    end
   
    p=0;    
    for a = x:(x+9)
        p=p+1;
        q=0;
        for b = y:(y+9)
            q=q+1;
            cx=0;
            cy=0;
            if(a>=9 && a<=(img_x-8) && b>=9 && b<=(img_y-8))
                sr_img(a,b) = sr_img(a,b) + (0.04*patches(p,q,n));
            else
                
                if(a==7 || a==8 ||a==(img_x-7) || a==(img_x-6))
                    cx=16;
                elseif(a==5 || a==6 || a==(img_x-4) || a==(img_x-5))
                    cx=9;
                elseif(a==3 || a==4 || a==(img_x-2) || a==(img_x-3))
                    cx=4;
                elseif(a==1 || a==2 || a==(img_x) || a==(img_x-1))
                    cx=1;
                end
                
                if(b==7 || b==8 || b==(img_y-7) || b==(img_y-6))
                    cy=16;
                elseif(b==5 || b==6 || b==(img_y-4) || b==(img_y-5))
                    cy=9;
                elseif(b==3 || b==4 || b==(img_y-2) || b==(img_y-3))
                    cy=4;
                elseif(b==1 || b==2 || b==(img_y) || b==(img_y-1))
                    cy=1;
                end
                
                if(cx==16 && cy==16)
                    sr_img(a,b) = sr_img(a,b) + (0.0625*patches(p,q,n));
                    continue;
                elseif(cx==16 || cy==16)
                    if(cx==9 || cy==9)
                        sr_img(a,b) = sr_img(a,b) + (0.0833*patches(p,q,n));
                        continue;
                    elseif(cx==4 || cy==4)
                        sr_img(a,b) = sr_img(a,b) + (0.125*patches(p,q,n));
                        continue;
                    elseif(cx==1 || cy==1)
                        sr_img(a,b) = sr_img(a,b) + (0.25*patches(p,q,n));
                        continue;
                    else
                        sr_img(a,b) = sr_img(a,b) + (0.05*patches(p,q,n));
                        continue;
                    end
                end
                
                if(cx==9 && cy==9)
                    sr_img(a,b) = sr_img(a,b) + (0.1111*patches(p,q,n));
                    continue;
                elseif(cx==9 || cy==9)
                    if(cx==4 || cy==4)
                        sr_img(a,b) = sr_img(a,b) + (0.1667*patches(p,q,n));
                        continue;
                    elseif(cx==1 || cy==1)
                        sr_img(a,b) = sr_img(a,b) + (0.3333*patches(p,q,n));
                        continue;
                    else
                        sr_img(a,b) = sr_img(a,b) + (0.0667*patches(p,q,n));
                        continue;
                    end
                end
                
                if(cx==4 && cy==4)
                    sr_img(a,b) = sr_img(a,b) + (0.25*patches(p,q,n));
                    continue;
                elseif(cx==4 || cy==4)
                    if(cx==1 || cy==1)
                        sr_img(a,b) = sr_img(a,b) + (0.5*patches(p,q,n));
                        continue;                         
                    else
                        sr_img(a,b) = sr_img(a,b) + (0.1*patches(p,q,n));
                        continue;
                    end
                end
                
                if(cx==1 && cy==1)
                    sr_img(a,b) = sr_img(a,b) + patches(p,q,n);
                    continue;
                elseif(cx==1 || cy==1)
                    sr_img(a,b) = sr_img(a,b) + (0.2*patches(p,q,n));
                    continue;
                end
                
            end
        end
    end
    
end
sr_img = uint8(sr_img);
end