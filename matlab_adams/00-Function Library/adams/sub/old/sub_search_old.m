function  spring_name_fun=sub_search(sub_addr)
% clear,clc
% aΪ��ʱ����
% sub_search
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_susp.sub';
sub_id=fopen(sub_addr,'r');
%������������������������
% ��ȡ����
data_sub_str=cell(1);
tline=fgetl(sub_id);
n=1;
while ischar(tline)
    data_sub_str(n)=cellstr(tline);
    n=n+1;
    tline=fgetl(sub_id);
end
data_sub_str=data_sub_str';
fclose(sub_id);
%������������������������
% ���ݴ���
% ȥ�� data_sub_str �еĿո�
for n=1:length(data_sub_str)
    a=cell2mat(data_sub_str(n));%��ȡ��n��
    b=find(isspace(a));%���ҿո�����λ��
    if ~isempty(b) %�ո����
        a(b)=[];%����n���ж�Ӧ�ո�λ������Ϊ[]����ɾ����
    end
    data_sub_str(n)=cellstr(a);%��������ĵ�n�д洢��data_sub_str��n��Ԫ����
end
a=find(strncmp('',data_sub_str,3));%���ҿ���
a=int32(a);
data_sub_str(a)=[];%ɾ����Ԫ��
clear a b;
%������������������������
%����������
major_role=search_in_sub('MAJOR_ROLE',data_sub_str);
%���Ҵ�����
minor_role=search_in_sub('MINOR_ROLE',data_sub_str);
%������������������������
%���ҵ������� ��������п���Ϊ����
spring_name=search_in_sub2('[NSPRING_ASSEMBLY]','USAGE',data_sub_str);
spring_name_fun=cell(1);
if length(spring_name)==2
    for n=1:length(spring_name)
        a=strfind(cell2mat(spring_name(n)),'front');
        b=strfind(cell2mat(spring_name(n)),'rear');
        if ~isempty(a)
            c=[major_role,'_',minor_role,...
                '_spring_rear_front=','''',cell2mat(spring_name(n)),''''];
            spring_name_fun(n)=cellstr(c);
        elseif ~isempty(b)
            c=[major_role,'_',minor_role,...
                '_spring_rear_name=','''',cell2mat(spring_name(n)),''''];
            spring_name_fun(n)=cellstr(c);
        else
            warning('�����������Ƴ��������ģ�嵯������')
        end
    end
elseif length(spring_name)==1
    c=[major_role,'_',minor_role,...
        '_spring_name=','''',cell2mat(spring_name),''''];
    spring_name_fun=cellstr(c);
else
    warning('����sub�е�����������2�飨����Ĭ��һ���������ҶԳƣ�����')
end

end

function name=search_in_sub(search_name,data_str)
% ����Դ data_sub_str Ԫ��
% ���nameΪ �ַ�
% ���������� search_name='name'��ʽ
a=strncmp(search_name,data_str,length(search_name));%�ж�ÿ���Ƿ����search_name
b=find(a==1);%����������
b=int32(b);
c=cell2mat(data_str(b));%ת��������Ԫ��Ϊ�ַ���
d=strfind(c,'''');%�����������еġ����ַ�
name=c(d(1)+1:d(2)-1);% �ַ�������Ϊminor_role
end

function name=search_in_sub2(header_name,search_name,data_str)
% ����Դ data_sub_str Ԫ��
% ��� name ΪԪ��
% �������������¸�ʽ
% $------------------------------
% [header_name]
% search_name='name'��ʽ
% $------------------------------(���м����б��ų�)
a=strncmp(header_name,data_str,length(header_name));
b=find(a==1);
if ~isempty(b) %��� header_name ����
    c=strncmp('$',data_str,1);%���ݶθ�����־��$��
    d=find(c==1);% '$'��������
    name=cell(1);
    for n=1:length(b) % ��n�� header_name
        e=find(d<b(n)); %���ݶ� [NSPRING_ASSEMBLY]��ͷ e(f(end))
        f=find(d>b(n)); %���ݶ� [NSPRING_ASSEMBLY]��β e(g(1))-1
        g=data_str(d(e(end)):d(f(1))-1);%���ݶ�-Ԫ����
        if isempty(f) %������ݶ�Ϊ���һ���Ļ�����β������ ��$��
            g=data_str(d(e(end)):d(end));%���ݶ�-Ԫ����
        end
        name(n)={search_in_sub(search_name,g)};%Ԫ�� search_name�������� ����search_in_sub
        clear e f g
    end
end
end