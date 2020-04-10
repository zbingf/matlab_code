clear,clc
tic
%
% 程序始于整车模型建立完成后，开始调整质心、弹簧载荷
%————————————
% 导入asy地址
% [filename,pathname]=uigetfile('*.asy','cmd文件地址');
% asy_addr=[pathname,filename];
asy_addr='G:\05_For_adams\fsae_2012.cdb\assemblies.tbl\fsae_full_vehicle.asy';
cbd_addr=fileparts(fileparts(asy_addr));
sub_addr=[cbd_addr,'\subsystems.tbl'];
%————————————
% 检索asy
% 输出-cbd文件夹名称-cbd_id
% 输出-总装配名称-asy_name
% 均不带‘.’
global cbd_name asy_name 
[cbd_name,asy_name,sub_name_fun]=asy_search(asy_addr);
for n=1:length(sub_name_fun)
    eval(cell2mat(sub_name_fun))
end
if exist('suspension_front_name')
    suspension_front_addr=[sub_addr,'\',suspension_front_name,'.sub'];
end
