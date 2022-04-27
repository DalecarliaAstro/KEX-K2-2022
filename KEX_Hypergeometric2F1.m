function output = KEX_Hypergeometric2F1(a,b,c,z,N)

output = 0;
for n=0:N
    output = output + (KEX_Pochhammer(a,n)*KEX_Pochhammer(b,n)*z^n)/(KEX_Pochhammer(c,n)*factorial(n));
end

return;