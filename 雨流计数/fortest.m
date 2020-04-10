% S-NÇúÏß¼ÆËã
clear,clc
n = 1:10:1e4;
k = -1;
b = 2.5;
y = 10.^( log10(n).*k + b );

figure;loglog(n,y) 
grid on;





