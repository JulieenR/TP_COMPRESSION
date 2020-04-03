function [y] = dctblocs(x,n) 
    D = dctmtx(n);
    
    dim = size(x);
    
    for i = 1:dim(3)
        xtmp = x(:,:,i);
        if i==1
            y = D*xtmp*D';
        else    
            y(:,:,i) = D*xtmp*D';
        end
    end
end