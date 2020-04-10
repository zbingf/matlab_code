clear;clc
% C=xlsread('load_F1');%%%%%%%%%在此修改加载的文件名，数据格式一直才可正确运算%%%
load('test_data.mat')
C = test_data';
B=C;A=C;
q=length(A);
%四点循环计数法
%% 步骤一 %%
%对载荷时间历程进行处理使它只包含峰谷峰谷交替出现
m=q;
for i=2:1:m-1
    if A(i-1)<A(i)&&A(i)<A(i+1)
        B(i)=NaN;
    elseif A(i-1)>A(i)&&A(i)>A(i+1)
        B(i)=NaN;
    end
end
B(isnan(B))=[];n=length(B);
%% 步骤二 %%
F=[];J=[];D=B;
while fun_4point(B)==1||fun_4point(B)==0
    if fun_4point(B)==1
        for j=1:n-4
            % 倒数第5点
            s1=abs(B(j+1)-B(j+2));
            s0=abs(B(j+3)-B(j));
            e3=(B(j+2)+B(j+1))/2;
            if s1<=s0
                F=[F;s1];
                J=[J;e3];
                B(j+1)=[];
                B(j+1)=[];
                n=length(B);
                break
            else
                continue
            end
        end
    elseif fun_4point(B)==0
        break
    end
    continue
end
%% 步骤三 %%
%画图像 三维hist三维图像
X=[J,F];
figure;hist3(X,[30 30]);
xlabel('均值');
title('雨流计数法-四点循环计数运算逻辑');
ylabel('幅值');
zlabel('循环次数');
