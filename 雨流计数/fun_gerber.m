function sigma_eqv = fun_gerber(X,sigma_b)
% ƽ��Ӧ������ Gerber׼��ʽ
% ͨ���������Բ���
% ����X Ϊ[ƽ��Ӧ��,Ӧ����ֵ;...]
% sigma_b Ϊ ǿ�ȼ���
% ��� ��ЧӦ����ֵ

% Ӧ�������ֵ
sigma_a = X(:,2);
% Ӧ�������ֵ
sigma_m = X(:,1);
% ��ЧӦ����ֵ
sigma_eqv = sigma_a .* sigma_b.^2 ./ ( sigma_b.^2 - sigma_m.^2 ) ;

end