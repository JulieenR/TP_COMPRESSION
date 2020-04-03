function [image_out] = decode_rlc(image_in)

    [a, nb_blocs] = size(image_in);
    insert = @(a, image_in, n)cat(2,  image_in(1:n-1), a, image_in(n+length(a):end));
    mat = zeros(nb_blocs, 64);

    for i = 1:nb_blocs
        line = [];
        j=1;
        while j < length(image_in{i})+1
            if (image_in{i}(j) == 257)
                line = [line, zeros(1, image_in{i}(j+1))];
                j=j+2;
            else
                line = [line image_in{i}(j)];
                j=j+1;
            end
                
        end
        mat(i, 1:end-1) = line;
    end
    image_out=mat;
end