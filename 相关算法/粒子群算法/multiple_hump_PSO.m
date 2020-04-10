% 多极值粒子群算法
% 单目标
% 个体历史最优 & 个体附近左右两个粒子的最优
clc
clear
close all
E=0.000001;% 精度设置
maxnum=30;%最大迭代次数
particlesize=50;%粒子群规模
c1=2;%每个粒子的个体学习因子，加速度常数
c2=1;%每个粒子的局部学习因子，加速度常数
w=0.6;%惯性因子
vmax=0.5;%粒子的最大飞翔速度
narvs=1;%目标函数的自变量个数
v=0.5*(rand(particlesize,narvs)-0.5);%粒子飞翔速度
x=4*pi*rand(particlesize,narvs);%粒子所在位置
%定义适应度函数
fitness=inline('sin(x)','x');
%%
for i=1:particlesize
    f(i)=fitness(x(i,:));    
end
personalbest_x=x;%
personalbest_faval=f;%
[globalbest_faval,i]=min(personalbest_faval); % 初始化全局最优
globalbest_x=personalbest_x(i,:);
k=1;
while (k<=maxnum)
    for i=1:particlesize %适应度计算
            f(i)=fitness(x(i,:));
        if f(i)<personalbest_faval(i) % 各个粒子历史最佳
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    % 局部最佳
    for i = 1:particlesize
        x1 = x(i) - x ;
        a1 = find(x1>0);
        a2 = find(x1<0);
        [~,b1] = min(abs(x1(a1)));% 大
        [~,b2] = min(abs(x1(a2)));% 小
        
        i1 = [(a1(b1)),(a2(b2))];
        [~,c] = min(abs(f(i1)));
        Locabest_x(i,:) = x(i1(c));
        Locabest_faval(i,:) =f(i1(c));
        %         
    end
    
%     [globalbest_faval,i]=min(personalbest_faval);% 全局最佳（从各个粒子历史最佳 取最大值）
%     globalbest_x=personalbest_x(i,:);% 
    
    %
    for i=1:particlesize
        v(i,:)=w*v(i,:)+c1*rand*(personalbest_x(i,:)-x(i,:))...
            +c2*rand*(Locabest_x(i,:)-x(i,:));
        for j=1:narvs
            if v(i,j)>vmax
                v(i,j)=vmax;
            elseif v(i,j)<-vmax
                v(i,j)=-vmax;
            end        
        end
        x(i,:)=x(i,:)+v(i,:);
    end
%     ff(k)=globalbest_faval;
%     if globalbest_faval<E % 当精度足够则中断迭代
%         break
%     end
    k=k+1;% 迭代次数
    pause(0.1)
    plot(x,x,'*')
    axis([0 (4*pi) 0 (4*pi)])
    drawnow
end
% xbest=globalbest_x;% 最优解
% plot(1:length(ff),ff);% 目标值