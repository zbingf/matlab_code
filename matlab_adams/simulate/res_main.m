clear,clc
% feature jit off
%--main--
tic
% [filename pathname]=uigetfile('*.res','choose a .res file');
% dizhi=[pathname filename];
dizhi='C:\Users\ABing\Documents\MATLAB\t_brake.res';
[data,data_str]=res_impordata(dizhi);%‘ÿ»Î ˝æ›
name_1='steering_assist';%Entity name
name_2='pinion_torque_front';%Component name
type='Request';%entType="Request" 
id_n=res_search_id(name_1,name_2,type,data_str);
toc

