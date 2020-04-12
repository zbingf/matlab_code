function re=fun_4point(B)
n=length(B);re=0;
for j=1:n-4
    s1=abs(B(j+1)-B(j+2));
    s0=abs(B(j+3)-B(j));
    if s1<=s0
        re=1;
        break
    else
        re=0;
        continue
    end
end
return
