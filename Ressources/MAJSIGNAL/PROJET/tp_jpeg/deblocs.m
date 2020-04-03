function [y] = deblocs(x)
    dim = size(x);
    y=zeros(8*sqrt(dim(3)));
    q=1;
    for k = 1:sqrt(dim(3))
        for j = 1:sqrt(dim(3))
            y(1+8*(j-1):1+8*(j-1)+7, 1+8*(k-1):1+8*(k-1)+7) = x(:, :, q);
            q = q+1;
        end
    end
end