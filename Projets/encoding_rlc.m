function [y] = encoding_rlc(x)
    dim = size(x);
    y = {};
    
    for i = 1:dim(1)
        
        idx = find(x(i,:)==0);
        idxcons = horzcat([0],diff(idx)==1);
        
        breakcons = find(idxcons==0);
        
        breakconstrue = [];
        nocz = [];
        
        for q = 1:length(breakcons)-1
            
            var = 0;
            k = 0;
            
            while (var == 0)
                
                var = x(i, k+idx(breakcons(q)));
                k = k+1;
                
            end
            
            if k>2
                
                breakconstrue = horzcat(breakconstrue,idx(breakcons(q)));
                nocz = horzcat(nocz,k-1);
                
            end
            
        end
        
        breakconstrue = horzcat(breakconstrue,idx(breakcons(end)));
        nocz = horzcat(nocz, 64-idx(breakcons(end)));
        
        
        k=1;
        yk = [];
        for j=1:length(breakconstrue)
            if (j==1)
                ind = 1;
            else
                ind = k + nocz(j-1) +1;
            end
            list1 = x(i, (ind):(breakconstrue(j)-1));
            k=breakconstrue(j)-1;
            listk = horzcat(list1, 257, nocz(j));
            yk = [yk, listk];
        y{i} = yk;
        
        end
        
    end
    
end