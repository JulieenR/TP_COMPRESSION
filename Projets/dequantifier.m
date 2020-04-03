function[image_out]=deQuantifier(image_in,Q)
    [M,N,nb_blocs] = size(image_in);
    
    for i = 1:nb_blocs
        image_intmp = image_in(:,:,i);
        if i==1
            image_out = image_intmp.*Q;
        else    
            image_out(:,:,i) = image_intmp.*Q;
        end
    end
end