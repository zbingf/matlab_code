% �༫ֵ����Ⱥ�㷨
% ��Ŀ��
% ������ʷ���� & ���帽�������������ӵ�����
clc
clear
close all
E=0.000001;% ��������
maxnum=30;%����������
particlesize=50;%����Ⱥ��ģ
c1=2;%ÿ�����ӵĸ���ѧϰ���ӣ����ٶȳ���
c2=1;%ÿ�����ӵľֲ�ѧϰ���ӣ����ٶȳ���
w=0.6;%��������
vmax=0.5;%���ӵ��������ٶ�
narvs=1;%Ŀ�꺯�����Ա�������
v=0.5*(rand(particlesize,narvs)-0.5);%���ӷ����ٶ�
x=4*pi*rand(particlesize,narvs);%��������λ��
%������Ӧ�Ⱥ���
fitness=inline('sin(x)','x');
%%
for i=1:particlesize
    f(i)=fitness(x(i,:));    
end
personalbest_x=x;%
personalbest_faval=f;%
[globalbest_faval,i]=min(personalbest_faval); % ��ʼ��ȫ������
globalbest_x=personalbest_x(i,:);
k=1;
while (k<=maxnum)
    for i=1:particlesize %��Ӧ�ȼ���
            f(i)=fitness(x(i,:));
        if f(i)<personalbest_faval(i) % ����������ʷ���
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    % �ֲ����
    for i = 1:particlesize
        x1 = x(i) - x ;
        a1 = find(x1>0);
        a2 = find(x1<0);
        [~,b1] = min(abs(x1(a1)));% ��
        [~,b2] = min(abs(x1(a2)));% С
        
        i1 = [(a1(b1)),(a2(b2))];
        [~,c] = min(abs(f(i1)));
        Locabest_x(i,:) = x(i1(c));
        Locabest_faval(i,:) =f(i1(c));
        %         
    end
    
%     [globalbest_faval,i]=min(personalbest_faval);% ȫ����ѣ��Ӹ���������ʷ��� ȡ���ֵ��
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
%     if globalbest_faval<E % �������㹻���жϵ���
%         break
%     end
    k=k+1;% ��������
    pause(0.1)
    plot(x,x,'*')
    axis([0 (4*pi) 0 (4*pi)])
    drawnow
end
% xbest=globalbest_x;% ���Ž�
% plot(1:length(ff),ff);% Ŀ��ֵ