function out = code_zigzag(image_in)
    
    % Lecture en zigzag
    
    dim = size(image_in);
    %Coordonnées du chemin en zig zag
    col = [1 2 1 1 2 3 4 3 2 1 1 2 3 4 5 6  5 4 3 2 1 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 8 7 6 5 4 3 4 5 6 7 8 8 7 6 5 6 7 8 8 7 8];
    lig = [1 1 2 3 2 1 1 2 3 4 5 4 3 2 1 1 2 3 4 5 6 7 6 5 4 3 2 1 1 2 3 4  5 6 7 8 8 7 6 5 4 3 2 3 4 5 6 7 8 8 7 6 5 4 5 6 7 8 8 7 6 7 8 8];
    for i = 1:dim(3)
        if i==1
            out = ones(1,64);
            for k = 1:64
                out(k) = image_in(lig(k),col(k),1);
            end
        else
            for k = 1:64
                out(i,k) = image_in(lig(k),col(k),i);
            end
        end
    end
    
            
    
end






















