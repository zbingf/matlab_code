function sigma_eqv = fun_goodman(X,sigma_b)
% ƽ��Ӧ������ Goodman׼��ʽ
% ͨ�����ڴ��Բ���
% ����X Ϊ[ƽ��Ӧ��,Ӧ����ֵ;...]
% sigma_b Ϊ ǿ�ȼ���
% ��� ��ЧӦ����ֵ

% Ӧ�������ֵ
sigma_a = X(:,2);
% Ӧ�������ֵ
sigma_m = X(:,1);
% ��ЧӦ����ֵ
sigma_eqv = sigma_a .* sigma_b ./ ( sigma_b - sigma_m ) ;

end