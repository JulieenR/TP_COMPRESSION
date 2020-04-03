% calculate the rlc vector

function [rlc] = rlencode(zigzag)
rlc = [];
count = 0;
for i=1:length(zigzag)
    val = zigzag(i);
    if val == 0
        count = count + 1;
    else
        if count > 0
            rlc = [rlc 257 count];
            count = 0;
        end;
        rlc = [rlc val];
    end;
end
if zigzag(length(zigzag))==0
    rlc = [rlc 257 count];
end