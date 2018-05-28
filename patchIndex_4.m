function pin = patchIndex_4(c,cpy)
    sz = size(cpy,1);
    
    if(sz<8)
       pin(1) =  cpy(floor(sz/2)-1,2);
       pin(2) =  cpy(floor(sz/2),2);
       pin(3) =  cpy(floor(sz/2)+1,2);
       pin(4) =  cpy(floor(sz/2)+2,2);
       return;
    end   
    
    d1 = abs(c-cpy(floor(sz/2),1));
    d2 = abs(c-cpy(floor(1+sz/2),1));   
    
    if(d1==0 || d2==0)
        pin(1) =  cpy(floor(sz/2)-1,2);
        pin(2) =  cpy(floor(sz/2),2);
        pin(3) =  cpy(floor(sz/2)+1,2);
        pin(4) =  cpy(floor(sz/2)+2,2);
        return;           
        
    elseif(d1<=d2)        
        cpy = cpy(1:floor(sz/2),:);
        pin = patchIndex_4(c, cpy);
        return;
        
    else   
        cpy = cpy(floor(1+sz/2):sz,:);
        pin = patchIndex_4(c, cpy);
        return;        
    end

end