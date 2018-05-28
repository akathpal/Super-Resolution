function weight = weight_new(x1,x2)
   k = size(x2,1);
   l = size(x1,1);
   o = ones(k,1,'double');
   G = zeros(k,k,'double');
   X = zeros(l^2,k,'double');
   xt = zeros(k^2,1,'double');
   Y = zeros(l^2,k,'double');
      
    for i = 1:1:k
         temp = x2{i,1};
             temp1 = temp(1,:)';
     for j = 2:1:size(x1,1)
         temp1 = vertcat(temp1,(temp(j,:))');
     end
        %display(temp1);
            Y(:,i) = temp1;
            temp1 = 0;
            %display(Y);
    end

    X=Y;
    X = double(X);

    xt = x1(1,:)';

    for i = 2:1:size(x1,1)
        xt = vertcat(xt,(x1(i,:))');
    end
    
    xt = double(xt);    
    P = (xt*(o')) - X;
    G = (P')*(P);
    display(P);
    display(G);

    weight = (inv(G)*o)/(o'*inv(G)*o);
    
    %weight = inv(G)*o;
end
    
    
    
    

