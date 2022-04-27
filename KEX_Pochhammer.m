function output = KEX_Pochhammer(x,m)

output = 1;    
if m>0
    for k=1:m
        output = output*(x+k-1);
    end
end

return;