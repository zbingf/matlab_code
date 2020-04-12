function damage = fun_pdi_cal(sigma_eqv,k,b)
% PDI ����
% Ǳ�����˼���
% ���� X Ϊ ��ЧӦ����ֵ
% б��k   �ؾ�b
% ��δ������
A = log10(b);
B = 1/k;
N = 10.^((log10(sigma_eqv)-A)./B) ;
% mean(N)
% mean(log10(N))
damage = sum(1 ./ N);
end

