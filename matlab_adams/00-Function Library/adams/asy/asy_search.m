function [cbd_name,asy_name,sub_name_eval,tpl_name_eval]=asy_search(asy_addr)
% ��ȡasy�ļ�,(adams 2014 )
% ��ø�����ϵͳ��Ϣ
% asy_addr��asyװ���ļ�����λ��
% cbd_name��Ϊǰ������ϵͳ���ڵ�cbd�ļ���
% asy_name��asy�ļ���
% sub_name_eval��sub�ļ���Ԫ���飨��Ҫeval����ÿһ�У�
% tpl_name_eval��tpl�ļ���Ԫ���飨��Ҫeval����ÿһ�У�
% ����ʱ�䣺2017/12/02

%% ��ȡ����asy�ĵ�
% clear,clc
% asy_addr='G:\05_For_adams\fsae_2012.cdb\assemblies.tbl\fsae_full_vehicle.asy';
% ���룺asy_addr
asy_id=fopen(asy_addr,'r');
data_asy_str=cell(1);
n=1;
while ~feof(asy_id)
    tline=fgetl(asy_id);
    data_asy_str(n)=cellstr(tline);
    n=n+1;
end
data_asy_str=data_asy_str';
fclose(asy_id);
% �����data_asy_str

%% ���ݴ���
% ���룺data_asy_str
% ȥ�� data_asy_str �еĿո�
for n=1:length(data_asy_str)
    a=cell2mat(data_asy_str(n));%ת��Ϊ �ַ���
    b=find(isspace(a));%���ҿո�����λ��
    if ~isempty(b) % ������ڿո�
    	a(b)=[];
    end
    data_asy_str(n)=cellstr(a);% �ַ���ת��ΪԪ��
end
% ȥ�� data_asy_str �е� ����
for n=1:length(data_asy_str)
    c=length(cell2mat(data_asy_str(n)));
    if c==0
        d(n)=1;
    else
        d(n)=0;
    end
end
e=find(d==1);
data_asy_str(e)=[];%ɾ����Ԫ��
% �����data_asy_str

%% ��ȡ��ϵͳ��Ϣ

% ���룺data_asy_str
search_part='[SUBSYSTEM]';% ��������
a=strncmp(search_part,data_asy_str,length(search_part));% ���� [SUBSYSTEM]
a_sub=find(a);% [SUBSYSTEM] data_asy_str������
data_sub_str=cell(6,length(a_sub));% Ԥ�� ��ϵͳ��Ϣ Ԫ���� (ÿ����ϵͳ��Ϣ 6��)
for n=1:length(a_sub)
    data_sub_str_n=data_asy_str(a_sub(n):a_sub(n)+5);
    data_sub_str(:,n)=data_sub_str_n;
end
% �����data_sub_str ���У���Ϣ���У���ϵͳ��

%% ��ϵͳ���ƶ��� 
% ���룺data_sub_str ���У���Ϣ���У���ϵͳ��
% [������_������_name=sub_name]
for n=1:length(data_sub_str(1,:))
    % MajorRole
    a=cell2mat(data_sub_str(3,n));
    major_role=a(strfind(a,':')+1:end);% ������
    % MinorRole
    b=cell2mat(data_sub_str(4,n));
    minor_role=b(strfind(b,':')+1:end);% ������
    % Template
    c=cell2mat(data_sub_str(5,n));
    tpl_name=c(strfind(c,':')+1:end);% Template_name
    % sub_name
    d=cell2mat(data_sub_str(6,n));
    d_n=strfind(d,'''');
    d=d(d_n(1)+1:d_n(2)-1);
    [e,sub_name,f]=fileparts(d);% ��ϵͳ����
    % ���
    sub_name_eval(n)=cellstr([major_role,'_',minor_role,'_name=','''',sub_name,''';']);
    tpl_name_eval(n)=cellstr([major_role,'_',minor_role,'_tpl_name=','''',tpl_name,''';']);
end
sub_name_eval=sub_name_eval';
tpl_name_eval=tpl_name_eval';
% �����sub_name_eval ��ϵͳ����
% tpl_name_eval ģ������

%% cbd_name asy_name
% cbd_name
[a,cbd_name,b]=fileparts(fileparts(fileparts(asy_addr)));
[c,asy_name,d]=fileparts(asy_addr);

%% 

end


