function [y] = decode_huffman(x, xdico)
    
    dim = size(x);
    
    for i = 1:dim(2)
        yk = huffmandeco(x{i}, xdico);
        y{i} = yk;
    end
    
end