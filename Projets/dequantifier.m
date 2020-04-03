function[y]=dequantifier(x,q)
    dim = size(x);
    
    for i = 1:dim(3)
        xtmp = x(:,:,i);
        if i==1
            y = xtmp.*q;
        else    
            y(:,:,i) = xtmp.*q;
        end
    end
end