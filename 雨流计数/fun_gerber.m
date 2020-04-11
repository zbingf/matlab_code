function sigma_eqv = fun_gerber(X,sigma_b)
% 平均应力修正 Gerber准则公式
% 通常用于韧性材料
% 输入X 为[平均应力,应力幅值;...]
% sigma_b 为 强度极限
% 输出 等效应力幅值

% 应力计算幅值
sigma_a = X(:,2);
% 应力计算均值
sigma_m = X(:,1);
% 等效应力幅值
sigma_eqv = sigma_a .* sigma_b.^2 ./ ( sigma_b.^2 - sigma_m.^2 ) ;

end