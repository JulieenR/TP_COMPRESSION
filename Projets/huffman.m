function [image_out, dict] = huffman(image_in)
    dim = size(image_in);
    
    image_in_flatten= zeros(1,64*1024);
    for i = 1:dim(2)
        image_in_flatten = horzcat(image_in_flatten, image_in{i});
    end
    val = unique(image_in_flatten);
    cnt = histc(image_in_flatten, val)./length(image_in_flatten);
    
    dict = huffmandict(val, cnt);
    
    for i = 1:dim(2)

        image_outk = huffmanenco(image_in{i}, dict);
        image_out{i} = transpose(image_outk);
        
    end
        