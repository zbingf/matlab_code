clear,clc
sub_addr='C:\Users\ABing\Documents\MATLAB\fsae_front_susp.sub';
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_arb.sub';
% ��ȡsub�ļ���Ϣ�����ܶ�ȡӲ�����ݣ�
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
search_part='[SUBSYSTEM_HEADER]';
a=strncmp(search_part,data_sub_str,length(search_part));% ���� [SUBSYSTEM_HEADER]
b=find(a);% [SUBSYSTEM_HEADER] ������
c=cell2mat(data_sub_str(b+2));
d=strfind(c,'''');
major_role=c(d(1)+1:d(2)-1);
c=cell2mat(data_sub_str(b+3));
d=strfind(c,'''');
minor_role=c(d(1)+1:d(2)-1);

%% ��ȡ������Ϣ
% ���룺data_sub_str
% �����ǵ�������
search_part='[NSPRING_ASSEMBLY]';
a=strncmp(search_part,data_sub_str,length(search_part));% ���� [DAMPER_ASSEMBLY]
a_spr=find(a);% [DAMPER_ASSEMBLY] data_sub_str������
data_spr_str=cell(7,length(a_spr));% Ԥ�� ������Ϣ Ԫ���� (ÿ����ϵͳ��Ϣ 7��)
if ~isempty(a_spr)
    for n=1:length(a_spr)
        data_spr_str(:,n)=data_sub_str(a_spr(n):a_spr(n)+6);
    end
    for n=1:length(data_spr_str(1,:))
        % spring_name
        a=cell2mat(data_spr_str(3,n));% ��3�� USAGE='spring_name';
        a1=strfind(a,'''');
        spring_name(n)=cellstr(a(a1(1)+1:a1(2)-1)); % spring_name Ԫ��
        % SYMMETRY �Գ���
        b=cell2mat(data_spr_str(4,n));% ��4�� SYMMETRY='left/right'or'left'or'right'
        b1=strfind(b,'''');
        spring_symmetry(n)=cellstr(b(b1(1)+1:b1(2)-1)); % ���ɶԳ���
        % PROPERTY_FILE �ļ�λ��addrA
        % PROPERTY_FILE='mdids://fsae_2012/springs.tbl/msc_0001.spr'
        c=cell2mat(data_spr_str(5,n));% ��5�� 
        c1=strfind(c,'''');
        spring_addrA(n)=cellstr(c(c1(1)+1:c1(2)-1)); % ���ɶԳ���
        clear a b c a1 b1 c1
    end
    c=[];
    for n=1:length(spring_name)
        a=strcmpi(cell2mat(spring_name(n)),spring_name);
        b=find(a);
        if length(b)>1
            c(n)=b(2);
        end
    end
    c=unique(c);
    spring_name(c)=[];
    spring_symmetry(c)=[];
    
    if length(spring_name)>1 %�����ֻһ�Ե���
        for n=1:length(spring_name)
            a=strfind(cell2mat(spring_name(n)),'front');
            b=strfind(cell2mat(spring_name(n)),'rear');
            if ~isempty(a)
                c=[major_role,'_',minor_role,...
                    '_spring_front_name=','''',cell2mat(spring_name(n)),''''];
                spring_name_eval(n)=cellstr(c);
            elseif ~isempty(b)
                c=[major_role,'_',minor_role,...
                    '_spring_rear_name=','''',cell2mat(spring_name(n)),''''];
                spring_name_eval(n)=cellstr(c);
            else
                warning('�����������Ƴ��������ģ�嵯������')
            end
        end
        if length(spring_name)>2
            error('����������2�ԣ���������')
        end
    else
        c=[major_role,'_',minor_role,...
            '_spring_name=','''',cell2mat(spring_name),''''];
        spring_name_eval=cellstr(c);
    end
end
% ���
% spring_name_eval

%% ��ȡ��������Ϣ
