function y = encoding_zigzag(x)
    
    % Lecture en zigzag
    
    dim = size(x);
    col = [1 2 1 1 2 3 4 3 2 1 1 2 3 4 5 6  5 4 3 2 1 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 8 7 6 5 4 3 4 5 6 7 8 8 7 6 5 6 7 8 8 7 8];
    lig = [1 1 2 3 2 1 1 2 3 4 5 4 3 2 1 1 2 3 4 5 6 7 6 5 4 3 2 1 1 2 3 4  5 6 7 8 8 7 6 5 4 3 2 3 4 5 6 7 8 8 7 6 5 4 5 6 7 8 8 7 6 7 8 8];
    for i = 1:dim(3)
        if i==1
            y = ones(1,64);
            for k = 1:64
                y(k) = x(lig(k),col(k),1);
            end
        else
            for k = 1:64
                y(i,k) = x(lig(k),col(k),i);
            end
        end
    end
    
            
    
end






















