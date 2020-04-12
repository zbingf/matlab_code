function X = fun_rainflow_4point(x)
% ���� Ӧ����ֵ , ��ֵ
[l1,l2] = size(x);
if l1 ==1 && l2>1
    C = x';
else
    C = x;
end
B=C;A=C;
q=length(A);
%�ĵ�ѭ��������
%% ����һ %%
%���غ�ʱ�����̽��д���ʹ��ֻ������ȷ�Ƚ������
m=q;
for i=2:1:m-1
    if A(i-1)<A(i)&&A(i)<A(i+1)
        B(i)=NaN;
    elseif A(i-1)>A(i)&&A(i)>A(i+1)
        B(i)=NaN;
    end
end
B(isnan(B))=[];n=length(B);
%% ����� %%
F=[];J=[];D=B;
while fun_4point(B)==1||fun_4point(B)==0
    if fun_4point(B)==1
        for j=1:n-4
            % ������5��
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
X=[J,F];
end

function re=fun_4point(B)
n=length(B);re=0;
for j=1:n-4
    s1=abs(B(j+1)-B(j+2));
    s0=abs(B(j+3)-B(j));
    if s1<=s0
        re=1;
        break
    else
        re=0;
        continue
    end
end
end

