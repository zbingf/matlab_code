function damage = fun_pdi_cal(sigma_eqv,k,b)
% PDI
% Ǳ�����˼���
% ���� X Ϊ ��ЧӦ����ֵ
% б��k   �ؾ�b


N = 10 .^ ( ( log10(sigma_eqv) - b ) ./ k );
damage = sum(1 ./ N);

end

