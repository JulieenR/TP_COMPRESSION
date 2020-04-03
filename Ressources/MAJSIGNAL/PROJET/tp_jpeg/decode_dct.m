function [y] = decode_dct(x)
%     D = dctmtx(8);
%     D = inv(D);
%     
%     dim = size(x);
%     
%     for i = 1:dim(3)
%         xtmp = x(:,:,i);
%         if i==1
%             y = D'*xtmp*D;
%         else    
%             y(:,:,i) = D'*xtmp*D;
%         end
%     end

    D = dctmtx(8);
    y = zeros(8, 8, 1024);
    for i=1:length(x)
        y(:, :, i) = inv(D)*x(:, :, i)*inv(transpose(D));
    end
end