function [image_redimensionnee] = redim(image_origine)
     [lin, col] = size(image_origine);
    linr = rem(lin,8);
    colr = rem(col,8);
    if linr~=0
        for k = linr:1:7
            image_origine = vertcat(image_origine,image_origine(end,:));
        end
    end
    if colr~=0
        for k = colr:1:7
            image_origine = horzcat(image_origine,image_origine(:,end));
        end
    end
    [lin,col] = size(image_origine);
    q = 0;
    for i = 1:8:lin
       for j = 1:8:col
           q = q+1;
           if (i==1 && j==1)
               image_redimensionnee = image_origine(i:i+7,j:j+7);
           else
               image_redimensionnee(:,:,q) = image_origine(i:i+7,j:j+7);
           end
       end
    end
end