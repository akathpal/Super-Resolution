function pin = patchIndex5(c,cpy)
    sz = size(cpy,1);
    
    if(sz<10)
       pin(1) =  cpy(floor(sz/2)-2,2); 
       pin(2) =  cpy(floor(sz/2)-1,2);
       pin(3) =  cpy(floor(sz/2),2);
       pin(4) =  cpy(floor(sz/2)+1,2);
       pin(5) =  cpy(floor(sz/2)+2,2);
       return;
    end   
    a = cpy(floor(sz/2),1);
    b = cpy(floor(1+sz/2),1);
    d1 = abs(c-a);
    d2 = abs(c-b);   
    
    if(d1==0 || d2==0)
        pin(1) =  cpy(floor(sz/2)-2,2);
        pin(2) =  cpy(floor(sz/2)-1,2);
        pin(3) =  cpy(floor(sz/2),2);
        pin(4) =  cpy(floor(sz/2)+1,2);
        pin(5) =  cpy(floor(sz/2)+2,2);
        return;           
        
    elseif(d1<=d2)        
        cpy = cpy(1:floor(sz/2),:);
        pin = patchIndex5(c,cpy);
        return;
        
    else   
        cpy = cpy(floor(1+sz/2):sz,:);
        pin = patchIndex5(c,cpy);
        return;        
    end

end