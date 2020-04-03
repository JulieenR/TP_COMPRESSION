function [image_out] = dct(image_in) 
    D = dctmtx(8);
    [N,M,nb_blocs] = size(image_in);
    
    for i = 1:nb_blocs
        bloc = image_in(:,:,i);
        if i==1
            image_out = D*bloc*D';
        else    
            image_out(:,:,i) = D*bloc*D';
        end
    end
end