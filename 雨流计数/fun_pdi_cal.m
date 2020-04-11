function damage = fun_pdi_cal(sigma_eqv,k,b)
% PDI
% 潜在损伤计算
% 输入 X 为 等效应力幅值
% 斜率k   截距b


N = 10 .^ ( ( log10(sigma_eqv) - b ) ./ k );
damage = sum(1 ./ N);

end

