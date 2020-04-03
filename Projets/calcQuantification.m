function [image_out] = calcmatQuantification(image_in,matQ)
    [N,M,nb_blocs] = size(image_in);
    
    for i = 1:nb_blocs
        image_intmp = image_in(:,:,i);
        if i==1
            image_out = round(image_intmp./matQ);
        else    
            image_out(:,:,i) = round(image_intmp./matQ);
        end
    end
end