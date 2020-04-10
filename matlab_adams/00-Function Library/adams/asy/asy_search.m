function [cbd_name,asy_name,sub_name_eval,tpl_name_eval]=asy_search(asy_addr)
% 读取asy文件,(adams 2014 )
% 获得各个子系统信息
% asy_addr：asy装配文件所在位置
% cbd_name：为前悬架子系统所在的cbd文件夹
% asy_name：asy文件名
% sub_name_eval：sub文件名元胞组（需要eval运行每一行）
% tpl_name_eval：tpl文件名元胞组（需要eval运行每一行）
% 更新时间：2017/12/02

%% 读取整个asy文档
% clear,clc
% asy_addr='G:\05_For_adams\fsae_2012.cdb\assemblies.tbl\fsae_full_vehicle.asy';
% 输入：asy_addr
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
% 输出：data_asy_str

%% 数据处理
% 输入：data_asy_str
% 去除 data_asy_str 中的空格
for n=1:length(data_asy_str)
    a=cell2mat(data_asy_str(n));%转化为 字符串
    b=find(isspace(a));%查找空格所在位置
    if ~isempty(b) % 如果纯在空格
    	a(b)=[];
    end
    data_asy_str(n)=cellstr(a);% 字符串转化为元胞
end
% 去除 data_asy_str 中的 空行
for n=1:length(data_asy_str)
    c=length(cell2mat(data_asy_str(n)));
    if c==0
        d(n)=1;
    else
        d(n)=0;
    end
end
e=find(d==1);
data_asy_str(e)=[];%删除空元胞
% 输出：data_asy_str

%% 提取子系统信息

% 输入：data_asy_str
search_part='[SUBSYSTEM]';% 搜索内容
a=strncmp(search_part,data_asy_str,length(search_part));% 查找 [SUBSYSTEM]
a_sub=find(a);% [SUBSYSTEM] data_asy_str所在行
data_sub_str=cell(6,length(a_sub));% 预设 子系统信息 元胞组 (每组子系统信息 6行)
for n=1:length(a_sub)
    data_sub_str_n=data_asy_str(a_sub(n):a_sub(n)+5);
    data_sub_str(:,n)=data_sub_str_n;
end
% 输出：data_sub_str （行：信息；列：子系统）

%% 子系统名称定义 
% 输入：data_sub_str （行：信息；列：子系统）
% [主特征_次特征_name=sub_name]
for n=1:length(data_sub_str(1,:))
    % MajorRole
    a=cell2mat(data_sub_str(3,n));
    major_role=a(strfind(a,':')+1:end);% 主特征
    % MinorRole
    b=cell2mat(data_sub_str(4,n));
    minor_role=b(strfind(b,':')+1:end);% 次特征
    % Template
    c=cell2mat(data_sub_str(5,n));
    tpl_name=c(strfind(c,':')+1:end);% Template_name
    % sub_name
    d=cell2mat(data_sub_str(6,n));
    d_n=strfind(d,'''');
    d=d(d_n(1)+1:d_n(2)-1);
    [e,sub_name,f]=fileparts(d);% 子系统名称
    % 输出
    sub_name_eval(n)=cellstr([major_role,'_',minor_role,'_name=','''',sub_name,''';']);
    tpl_name_eval(n)=cellstr([major_role,'_',minor_role,'_tpl_name=','''',tpl_name,''';']);
end
sub_name_eval=sub_name_eval';
tpl_name_eval=tpl_name_eval';
% 输出：sub_name_eval 子系统名称
% tpl_name_eval 模板名称

%% cbd_name asy_name
% cbd_name
[a,cbd_name,b]=fileparts(fileparts(fileparts(asy_addr)));
[c,asy_name,d]=fileparts(asy_addr);

%% 

end


