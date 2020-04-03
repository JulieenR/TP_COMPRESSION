function [y] = decode_rlc(x)

    dim = size(x);
    insert = @(a, x, n)cat(2,  x(1:n-1), a, x(n+length(a):end));
    mat = zeros(dim(2), 64);

    for i = 1:dim(2)
        line = [];
        j=1;
        while j < length(x{i})+1
            if (x{i}(j) == 257)
                line = [line, zeros(1, x{i}(j+1))];
                j=j+2;
            else
                line = [line x{i}(j)];
                j=j+1;
            end
                
        end
        mat(i, 1:end-1) = line;
    end
    y=mat;
end