function [y] = decode_zigzag(x)
    ind_x = [1 1 2 3 2 1 1 2 3 4 5 4 3 2 1 1 2 3 4 5 6 7 6 5 4 3 2 1 1 2 3 4 5 6 7 8 8 7 6 5 4 3 2 3 4 5 6 7 8 8 7 6 5 4 5 6 7 8 8 7 6 7 8 8];
    ind_y = [1 2 1 1 2 3 4 3 2 1 1 2 3 4 5 6 5 4 3 2 1 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 8 7 6 5 4 3 4 5 6 7 8 8 7 6 5 6 7 8 8 7 8];
    
    dim = size(x);
    y = zeros(8, 8, 1024);
    for i=1:dim(1)
        mat = zeros(8, 8);
        for index=1:dim(2)
            mat(ind_x(index), ind_y(index)) = x(i, index);
        end
        y(:, :, i) = mat;
    end
end