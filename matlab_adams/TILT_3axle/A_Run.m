clear,clc
tic
%
% ����ʼ������ģ�ͽ�����ɺ󣬿�ʼ�������ġ������غ�
%������������������������
% ����asy��ַ
% [filename,pathname]=uigetfile('*.asy','cmd�ļ���ַ');
% asy_addr=[pathname,filename];
asy_addr='G:\05_For_adams\fsae_2012.cdb\assemblies.tbl\fsae_full_vehicle.asy';
cbd_addr=fileparts(fileparts(asy_addr));
sub_addr=[cbd_addr,'\subsystems.tbl'];
%������������������������
% ����asy
% ���-cbd�ļ�������-cbd_id
% ���-��װ������-asy_name
% ��������.��
global cbd_name asy_name 
[cbd_name,asy_name,sub_name_fun]=asy_search(asy_addr);
for n=1:length(sub_name_fun)
    eval(cell2mat(sub_name_fun))
end
if exist('suspension_front_name')
    suspension_front_addr=[sub_addr,'\',suspension_front_name,'.sub'];
end
