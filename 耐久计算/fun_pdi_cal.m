function damage = fun_pdi_cal(sigma_eqv,k,b)
% PDI 计算
% 潜在损伤计算
% 输入 X 为 等效应力幅值
% 斜率k   截距b
% 尚未调整完
A = log10(b);
B = 1/k;
N = 10.^((log10(sigma_eqv)-A)./B) ;
% mean(N)
% mean(log10(N))
damage = sum(1 ./ N);
end

