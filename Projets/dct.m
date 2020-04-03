function [image_out] = dct(image_in) 
    D = dctmtx(8);
    
    dim = size(image_in);
    
    for i = 1:dim(3)
        bloc = image_in(:,:,i);
        if i==1
            image_out = D*bloc*D';
        else    
            image_out(:,:,i) = D*bloc*D';
        end
    end
end