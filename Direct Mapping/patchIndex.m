function pin = patchIndex(c,cpy)
    sz = size(cpy,1);
    if(sz==1)
        pin=cpy(1,2);
        return;
    elseif(sz<1)
        pin=0;
        return;
    end
    
    d1 = abs(c-cpy(floor(sz/2),1));
    d2 = abs(c-cpy(floor(1+sz/2),1));
    
    if(sz==2)
        if(d1<=d2)
            pin = cpy(floor(sz/2),2);
        return;        
        else
            pin = cpy(floor(1+sz/2),2);
        return;
        end
    end
    
    if(d1==0)
        pin = cpy(floor(sz/2),2);
        return;
        
    elseif(d2==0)
        pin = cpy(floor(1+sz/2),2);
        return;
        
    elseif(d1<=d2)        
        cpy = cpy(1:floor(sz/2),:);
        pin = patchIndex(c, cpy);
        return;
        
    else   
        cpy = cpy(floor(1+sz/2):sz,:);
        pin = patchIndex(c, cpy);
        return;        
    end

end