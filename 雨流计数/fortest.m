% % S-N���߼���
% clear,clc
% n = 1:10:1e4;
% k = -1;
% b = 2.5;
% y = 10.^( log10(n).*k + b );
% 
% figure;loglog(n,y) 
% grid on;

%% ��������
clear,clc
load('test_data.mat')
C = test_data';
X = fun_rainflow_4point(C);
X2 = fun_rainflow_3point(C);

% figure;hist3(X,[30 30]);
% xlabel('��ֵ');
% title('����������-�ĵ�ѭ�����������߼�');
% ylabel('��ֵ');
% zlabel('ѭ������');
% 
% figure;hist3(X2,[30 30]);
% xlabel('��ֵ');
% title('����������-����ѭ�����������߼�');
% ylabel('��ֵ');
% zlabel('ѭ������');

%% ƽ��Ӧ������
% Gerber ׼��ʽ
% ǿ�ȼ��� MPa
sigma_b = 1400 ; 
sigma_eqv = fun_gerber(X,sigma_b);
%% PDI
damage = fun_pdi_cal(sigma_eqv*100,-5,5000);
damage

%% S-N
% b = 1274;
% k = 

%% miner_linear 










