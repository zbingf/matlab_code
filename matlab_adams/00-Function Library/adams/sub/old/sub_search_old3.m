function  data=sub_search_new2 % (sub_addr)
clear,clc
sub_addr='C:\Users\ABing\Documents\MATLAB\fsae_front_susp.sub';
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_arb.sub';
% ��ȡsub�ļ���Ϣ�����ܶ�ȡӲ�����ݣ�
% �������ڣ�2017/12/02
%% ��ȡ����sub�ĵ�
% ���룺sub_addr
sub_id=fopen(sub_addr,'r');
data_sub_str=cell(1);
n=1;
while ~feof(sub_id)
    tline=fgetl(sub_id);
    data_sub_str(n)=cellstr(tline);
    n=n+1;
end
data_sub_str=data_sub_str';
fclose(sub_id);
% �����data_sub_str

%% ���ݴ���
% ���룺data_sub_str
% ȥ�� data_sub_str �еĿո�
for n=1:length(data_sub_str)
    a=cell2mat(data_sub_str(n));%ת��Ϊ �ַ���
    b=find(isspace(a));%���ҿո�����λ��
    if ~isempty(b) % ������ڿո�
        a(b)=[];
    end
    data_sub_str(n)=cellstr(a);% �ַ���ת��ΪԪ��
end
% ȥ�� data_sub_str �е� ����
for n=1:length(data_sub_str)
    c=length(cell2mat(data_sub_str(n)));
    if c==0
        d(n)=1;
    else
        d(n)=0;
    end
end
e=find(d==1);
data_sub_str(e)=[];%ɾ����Ԫ��
% �����data_sub_str
%% major/minor role
major_role=search_in_sub2('[SUBSYSTEM_HEADER]','MAJOR_ROLE',data_sub_str);
minor_role=search_in_sub2('[SUBSYSTEM_HEADER]','MINOR_ROLE',data_sub_str);
major_role=cell2mat(major_role);
minor_role=cell2mat(minor_role);

%% ��ȡ������Ϣ
data.spring_data=spring_search_in_sub(data_sub_str,major_role,minor_role);

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

function spring_data=spring_search_in_sub(data_sub_str,major_role,minor_role)
% ���룺data_sub_str major_role minor_role

% $---------------------------------------------------------------NSPRING_ASSEMBLY
% [NSPRING_ASSEMBLY]
% DEFINITION='.ACAR.forces.ac_spring'
% USAGE='ride_spring1'
% SYMMETRY='left/right' or 'left' or 'right' or 'single'
% PROPERTY_FILE='mdids://fsae_2012/springs.tbl/msc_0001.spr'
% VALUE_TYPE='preload'
% USER_VALUE=2000.0

search_part='[NSPRING_ASSEMBLY]';
search_a=strncmp(search_part,data_sub_str,length(search_part));% ���� [NSPRING_ASSEMBLY]
line_spr=find(search_a);% [NSPRING_ASSEMBLY] data_sub_str������
if ~isempty(line_spr) % ����е���
    spring_name=search_in_sub2('[NSPRING_ASSEMBLY]','USAGE',data_sub_str);% ��������
    spring_symmetry=search_in_sub2('[NSPRING_ASSEMBLY]','SYMMETRY',data_sub_str);% ���ɶԳ���
    spring_addrA=search_in_sub2('[NSPRING_ASSEMBLY]','PROPERTY_FILE',data_sub_str);% �����ļ���ַ
    % ��� spring_name spring_addrA spring_symmetry
    % ����������������������������������������������������
    % ���룺spring_name
    % ������ֵ���裨���ٶԵ��ɣ�
    n_a=1;
    spring_name1=spring_name; % ��ʱ��������
    for n=1:length(spring_name)
        a=strcmpi(cell2mat(spring_name(n)),spring_name1);%�Ա�spring_name(n)��spring_name1
        b=find(a);%
        if ~isempty(b) % ��� spring_name(n)�� spring_name1 ���ҵõ�,ȫ��������ֵ n_a
            for n2=1:length(b)
                spring_num(b(n2))=n_a;
                spring_name1(b(n2))={''};%ȥ�� spring_name1�е�spring_name(n)
            end
            n_a=n_a+1;% ������ֵ+1
        end
    end
    clear spring_name1 n_a
    % �����spring_num
    spring_num
    % ����������������������������������������������������
    % ���� spring_num spring_name spring_addrA
    n_a=1;
    for n=1:length(spring_name)
        if strcmpi('left',cell2mat(spring_symmetry(n)))
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_name=''','nsl_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        elseif strcmpi('right',cell2mat(spring_symmetry(n)))
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_name=''','nsr_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        elseif strcmpi('left/right',cell2mat(spring_symmetry(n)))
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_name=''','nsl_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
            
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_name=''','nsr_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        else %��������
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_single_name=''','nss_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_single_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        end
    end
    % data.spring_data=spring_data;
else
    spring_data=[];
end
% ��� spring_data
% spring_data.name_eval
% spring_data.addrA_eval
end