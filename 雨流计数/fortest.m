% % S-N曲线计算
% clear,clc
% n = 1:10:1e4;
% k = -1;
% b = 2.5;
% y = 10.^( log10(n).*k + b );
% 
% figure;loglog(n,y) 
% grid on;

%% 雨流计数
clear,clc
load('test_data.mat')
C = test_data';
X = fun_rainflow_4point(C);
X2 = fun_rainflow_3point(C);

% figure;hist3(X,[30 30]);
% xlabel('均值');
% title('雨流计数法-四点循环计数运算逻辑');
% ylabel('幅值');
% zlabel('循环次数');
% 
% figure;hist3(X2,[30 30]);
% xlabel('均值');
% title('雨流计数法-三点循环计数运算逻辑');
% ylabel('幅值');
% zlabel('循环次数');

%% 平均应力修正
% Gerber 准则公式
% 强度极限 MPa
sigma_b = 1400 ; 
sigma_eqv = fun_gerber(X,sigma_b);
%% PDI
damage = fun_pdi_cal(sigma_eqv*100,-5,5000);
damage

%% S-N
% b = 1274;
% k = 

%% miner_linear 










