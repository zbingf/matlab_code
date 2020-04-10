 function [cbd_name,asy_name,sub_name_fun]=asy_search(asy_addr)
% asy_addr='C:\Users\ABing\Documents\MATLAB\TILT_3axle\fsae_full_vehicle.asy';
% ��ȡasy�ļ�
% ��ø�����ϵͳ
% asy_addr ; asyװ���ļ�����λ��
% �����cbd_idΪǰ������ϵͳ���ڵ�cbd�ļ���
asy_id=fopen(asy_addr,'r');
% ��ȡ����
data_asy_str=cell(1);
tline=fgetl(asy_id);
n=1;
while ischar(tline)
    data_asy_str(n)=cellstr(tline);
    n=n+1;
    tline=fgetl(asy_id);
end
data_asy_str=data_asy_str';
fclose(asy_id);

% ���ݴ���
% ȥ�� data_asy_str �еĿո�
for n=1:length(data_asy_str)
    a=cell2mat(data_asy_str(n));
    b=find(isspace(a));%���ҿո�����λ��
    if ~isempty(b)
    	a(b)=[];
    end
    data_asy_str(n)=cellstr(a);
    clear a b;
end
a=find(strncmp('',data_asy_str,3));
data_asy_str(a)=[];%ɾ����Ԫ��

%����
sub_major_role={'antirollbar','wheel','brake_system',...
    'powertrain','body','steering','suspension'};
sub_minor_role={'front','rear','any','rear_2'};
n_sub=0;%��ϵͳ����
sub_name_fun=cell(1);
for n=1:length(sub_major_role) %������ѭ��һ��
    sub_major_data=['$MajorRole:',cell2mat(sub_major_role(n))];%��ǰ���������������ַ���
    a_major=strncmp(sub_major_data,data_asy_str,length(sub_major_data));%ÿ�п�ͷ������ͬ�ַ���
    b_major=find(a_major);%������ͬ����������������
    for n1=1:length(sub_minor_role) %������ѭ��һ��
        sub_minor_data=['$MinorRole:',cell2mat(sub_minor_role(n1))];%��ǰ���������������ַ���
        a_minor=strncmp(sub_minor_data,data_asy_str,length(sub_minor_data));%ÿ�п�ͷ������ͬ�ַ���
        b_minor=find(a_minor);%������ͬ����������������
        for n2=1:length(b_minor) %���� ��ͬ������ ��������
            b_delta=b_major-b_minor(n2);% ����������������ȥָ������������
            a=find(b_delta==-1);%����������������һ�У���b_deltaΪ-1ʱ������Ϊͬһϵͳ
            b=length(sub_minor_data)==...     %�����ַ������ȶԱ� ���� rear��rear_2�Ļ���
                length(cell2mat(data_asy_str(b_minor(n2))));
            if ~isempty(a)&&b %��� a��b �Բ�Ϊ�գ�������������Ӧ��ϵͳ����
                sub_name=[cell2mat(sub_major_role(n)),'_',...
                    cell2mat(sub_minor_role(n1)),'_name'];%ϵͳ��������
                a=cell2mat(data_asy_str(b_minor(n2)+2));%��������+2Ϊ��������
                b=strfind(a,'''');%����''��Ϊ��ϵͳ��������
                c=a((b(1)+1):(b(2)-1));%��ϵͳ��������
%                 eval([sub_name,'=''',c,''';']);
                n_sub=n_sub+1;
                [a,sub_name1,b]=fileparts(c);
                sub_name_fun(n_sub)=cellstr([sub_name,'=''',sub_name1,''';']);
            end
        end
    end
end
cbd_name=fileparts(fileparts(c));
cbd_name(1)=[];cbd_name(end)=[];% ���cbd�ļ�������
[a,asy_name,b]=fileparts(asy_addr);%asy����
clear a b c

end








