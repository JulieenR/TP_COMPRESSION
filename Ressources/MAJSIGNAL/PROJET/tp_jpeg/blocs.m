function [y] = blocs(x)
    [lin, col] = size(x);
    linr = rem(lin,8);
    colr = rem(col,8);
    if linr~=0
        for k = linr:1:7
            x = vertcat(x,x(end,:));
        end
    end
    if colr~=0
        for k = colr:1:7
            x = horzcat(x,x(:,end));
        end
    end
    [lin,col] = size(x);
    q = 0;
    for i = 1:8:lin
       for j = 1:8:col
           q = q+1;
           if (i==1 && j==1)
               y = x(i:i+7,j:j+7);
           else
               y(:,:,q) = x(i:i+7,j:j+7);
           end
       end
    end
end