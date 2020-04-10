clear,clc
format long
[filename pathname]=uigetfile('*.res','choose a .res file');
dizhi=[pathname filename];
data_res=textread(dizhi,'%s');
n_start=strmatch('<Step',data_res);%搜索数组起始位置
n_end=strmatch('</Step>',data_res);%搜索数组结束位置
n_start(1:2)=[];%去掉第一组input
n_end(1)=[];
n_start=n_start+2;
n_end=n_end-1;
delta_n=n_end-n_start;
for n_1=1:1:length(delta_n)
    data(n_1,:)=rot90(str2double(data_res(n_start:n_end)));
end

% a =strmatch('<Entity name="til_wheel_tire_forces"',data_res);
% a=a+1;
% for n_3=1:1:length(a)
%     b=cell2mat(data_res(a(n_3)));
%     
% %     length(b)
% end