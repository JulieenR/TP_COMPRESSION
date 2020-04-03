function [image_out] = decode_dct(image_in)

    D = dctmtx(8);
    image_out = zeros(8, 8, 1024);
    for i=1:length(image_in)
        image_out(:, :, i) = inv(D)*image_in(:, :, i)*inv(transpose(D));
    end
end