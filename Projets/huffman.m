function [y, dico] = huffman(x)
    dim = size(x);
    
    x_flatten= zeros(1,64*1024);
    for i = 1:dim(2)
        x_flatten = horzcat(x_flatten, x{i});
    end
    val = unique(x_flatten);
    cnt = histc(x_flatten, val)./length(x_flatten);
    
    dico = huffmandict(val, cnt);
    
    for i = 1:dim(2)

        yk = huffmanenco(x{i}, dico);
        y{i} = transpose(yk);
        
    end
        