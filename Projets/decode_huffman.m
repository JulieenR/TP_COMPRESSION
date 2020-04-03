function [image_out] = decode_huffman(x, dico)
    
    [a,nb_blocs] = size(x);
    for i = 1:nb_blocs
        image_outk = huffmandeco(x{i}, dico);
        image_out{i} = image_outk;
    end
    
end