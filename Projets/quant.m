function [y] = quant(x,q)
    dim = size(x);
    
    for i = 1:dim(3)
        xtmp = x(:,:,i);
        if i==1
            y = round(xtmp./q);
        else    
            y(:,:,i) = round(xtmp./q);
        end
    end
end