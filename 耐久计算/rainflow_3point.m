clear;clc
% C=xlsread('load_F');%%%%%%%%%在此修改加载的文件名，数据格式一直才可正确运算%%%
% rand(1,1000)*5  % 随机生成数组
load('test_data.mat')
C = test_data';
B=C;A=C; % 赋值
q=length(A); % 数据长度
%三点循环计数法；部分参考SAE ASTM标准
%% 步骤一 %%
%对载荷时间历程进行处理使它只包含峰谷峰谷交替出现
m=q;
for i=2:1:m-1 % 第二点数据到倒数第二点数据
    if A(i-1)<A(i)&&A(i)<A(i+1)
        % 第一条线上坡 , 第二条也上坡
        % 对两条线的中间点 ,赋值NaN ,即去掉该点
        B(i)=NaN;
    elseif A(i-1)>A(i)&&A(i)>A(i+1)
        % 第一条线下坡,第二条也下坡
        % 对两条线的中间点 ,赋值NaN ,即去掉该点
        B(i)=NaN;
    end
end
B(isnan(B))=[]; % 去掉无效点

%% 步骤二 %%
%对载荷时间历程再造，使从最大（小）值拆开，前后拼接，使从最值开始最值结束
[a,b]=max(B); % a最大值, b其位置
n=length(B);% 数据长度
% 以最大值为中点,将数据拆分成两半
B1=B(b:n); 
B2=B(1:b);
% 重新拼接,将最大值放置在最前面
B=[B1;B2];

%% 步骤三 %%
%再只留波峰波谷，防止拼接处出现不合理的数据
A=B;m=length(B);
for i=2:1:m-1
    % 重复步骤一
    if A(i-1)<A(i)&&A(i)<A(i+1)
        B(i)=NaN;
    elseif A(i-1)>A(i)&&A(i)>A(i+1)
        B(i)=NaN;
    end
end
B(isnan(B))=[];n=length(B);
%%%%%%%%%%%%%%%%%%%%%%%% B为改造后载荷时间历程 n为B中波峰波谷的个数
%% 步骤四 %%
%雨流计数记因素 1幅值F 2均值J 开启无脑循环模式
F=[];J=[];D=B;
while length(B)>=1
    n=length(B); % 当前个数
    if n==1 % 剩一个是则终止循环
        break
    elseif n>1
        % 数据长度大于1
        for j=1:n-2
            % 第一点到倒数第三点
            s1=abs(B(j+1)-B(j)); % 第一段线 高度
            s2=abs(B(j+1)-B(j+2)); % 第二段线 高度
            e3=(B(j)+B(j+1))/2; % 第一段线均值
            if s1<=s2
                % 第一段 < 第二段 高度
                F=[F;s1]; % 增加幅值 ,第一段
                J=[J;e3]; % 增加均值 ,第一段
                B(j)=[]; 
                B(j)=[]; % 删除第一段线的两点的数据
                n=length(B); % 重新计算数据长度
                break; % 结束for 进入下一个while循环
            else
                continue; % 下一步for
            end
        end
    end
    continue
end
%% 步骤五 %%
%画图像 三维hist三维图像
% 均值,幅值
X=[J,F];
figure;hist3(X,[30 30]);
xlabel('均值');
title('雨流计数法-三点循环计数运算逻辑');
ylabel('幅值');
zlabel('循环次数');
%% 检验说明 %%
% load_Ftest运算与手算一致，与其他语言的计算结果幅值F，均值J一直，其他的数据也证明是可以正确运行的
%%%%存在的问题
%拼接后可能会损失拼接处数据，未知是否会对结果有偏差
