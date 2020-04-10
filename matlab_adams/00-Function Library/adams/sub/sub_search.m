function  data=sub_search(sub_addr)
% clear,clc
% sub_addr='C:\Users\ABing\Documents\MATLAB\fsae_front_susp.sub';
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_susp.sub';
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_rear_arb.sub';

% ��ȡsub�ļ���Ϣ�����ܶ�ȡӲ�����ݣ�
% �������ڣ�2017/12/23
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
data.spring=spring_search_in_sub(data_sub_str);
%% ��ȡ������Ϣ
data.damper=damper_search_in_sub(data_sub_str);

end

% �����Ӻ���1
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
% �����Ӻ���2
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
% ����������ȡ
function spring=spring_search_in_sub(data_sub_str) 
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
    % ���룺spring_symmetry
    for n=1:length(spring_symmetry)
        if strncmpi('single',spring_symmetry(n),6)
            if ~exist('n_single','var') %������ n_single������1��
                n_single=1;
            else
                n_single=n_single+1;
            end
            spring.single(n_single).name={['nss_',cell2mat(spring_name(n))]};
            spring.single(n_single).addrA=spring_addrA(n);
        elseif strncmpi('left/right',spring_symmetry(n),10)
            if ~exist('n_double','var') %������ n_double������1��
                n_double=1;
            else
                n_double=n_double+1;
            end
            spring.double(n_double).name={['nsl_',cell2mat(spring_name(n))]}; % ��
            spring.double(n_double).addrA=spring_addrA(n);
            n_double=n_double+1;
            spring.double(n_double).name={['nsr_',cell2mat(spring_name(n))]}; % ��
            spring.double(n_double).addrA=spring_addrA(n);
        elseif strncmpi('left',spring_symmetry(n),4)
            if ~exist('n_double','var') %������ n_double������1��
                n_double=1;
            else
                n_double=n_double+1;
            end
            spring.double(n_double).name={['nsl_',cell2mat(spring_name(n))]}; % ��
            spring.double(n_double).addrA=spring_addrA(n);
            for n1=1:length(spring_name)
                if strcmpi(spring_name(n),spring_name(n1))&&~(n1==n)
                    n_double=n_double+1;
                    spring.double(n_double).name={['nsr_',cell2mat(spring_name(n))]}; % ��
                    spring.double(n_double).addrA=spring_addrA(n);
                end
            end
        end
    end
else
    spring=[];
end

end 
% ���������� ���Ƶ��ɴ���ʽ
function damper=damper_search_in_sub(data_sub_str) 
% ���룺data_sub_str major_role minor_role

% $---------------------------------------------------------------NDAMPER_ASSEMBLY
% [DAMPER_ASSEMBLY]
% DEFINITION='.ACAR.forces.ac_damper'
% USAGE='ride_damper1'
% SYMMETRY='left/right' or 'left' or 'right' or 'single'
% PROPERTY_FILE  =  'mdids://fsae_2012/dampers.tbl/msc_0001.dpr'

search_part='[DAMPER_ASSEMBLY]';
search_a=strncmp(search_part,data_sub_str,length(search_part));% ���� [DAMPER_ASSEMBLY]
line_spr=find(search_a);% [DAMPER_ASSEMBLY] data_sub_str������
if ~isempty(line_spr) % ���������
    damper_name=search_in_sub2('[DAMPER_ASSEMBLY]','USAGE',data_sub_str);% ��������
    damper_symmetry=search_in_sub2('[DAMPER_ASSEMBLY]','SYMMETRY',data_sub_str);% ����Գ���
    damper_addrA=search_in_sub2('[DAMPER_ASSEMBLY]','PROPERTY_FILE',data_sub_str);% �����ļ���ַ
    % ��� damper_name damper_addrA damper_symmetry
    % ����������������������������������������������������
    % ���룺damper_symmetry
    for n=1:length(damper_symmetry)
        if strncmpi('single',damper_symmetry(n),6)
            if ~exist('n_single','var') %������ n_single������1��
                n_single=1;
            else
                n_single=n_single+1;
            end
            damper.single(n_single).name={['das_',cell2mat(damper_name(n))]};
            damper.single(n_single).addrA=damper_addrA(n);
        elseif strncmpi('left/right',damper_symmetry(n),10)
            if ~exist('n_double','var') %������ n_double������1��
                n_double=1;
            else
                n_double=n_double+1;
            end
            damper.double(n_double).name={['dal_',cell2mat(damper_name(n))]}; % ��
            damper.double(n_double).addrA=damper_addrA(n);
            n_double=n_double+1;
            damper.double(n_double).name={['dar_',cell2mat(damper_name(n))]}; % ��
            damper.double(n_double).addrA=damper_addrA(n);
        elseif strncmpi('left',damper_symmetry(n),4)
            if ~exist('n_double','var') %������ n_double������1��
                n_double=1;
            else
                n_double=n_double+1;
            end
            damper.double(n_double).name={['dal_',cell2mat(damper_name(n))]}; % ��
            damper.double(n_double).addrA=damper_addrA(n);
            for n1=1:length(damper_name)
                if strcmpi(damper_name(n),damper_name(n1))&&~(n1==n)
                    n_double=n_double+1;
                    damper.double(n_double).name={['dar_',cell2mat(damper_name(n))]}; % ��
                    damper.double(n_double).addrA=damper_addrA(n);
                end
            end
        end
    end
else
    damper=[];
end
end 