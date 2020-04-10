 function [cbd_name,asy_name,sub_name_fun]=asy_search(asy_addr)
% asy_addr='C:\Users\ABing\Documents\MATLAB\TILT_3axle\fsae_full_vehicle.asy';
% 读取asy文件
% 获得各个子系统
% asy_addr ; asy装配文件所在位置
% 输出的cbd_id为前悬架子系统所在的cbd文件夹
asy_id=fopen(asy_addr,'r');
% 读取数据
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

% 数据处理
% 去除 data_asy_str 中的空格
for n=1:length(data_asy_str)
    a=cell2mat(data_asy_str(n));
    b=find(isspace(a));%查找空格所在位置
    if ~isempty(b)
    	a(b)=[];
    end
    data_asy_str(n)=cellstr(a);
    clear a b;
end
a=find(strncmp('',data_asy_str,3));
data_asy_str(a)=[];%删除空元胞

%查找
sub_major_role={'antirollbar','wheel','brake_system',...
    'powertrain','body','steering','suspension'};
sub_minor_role={'front','rear','any','rear_2'};
n_sub=0;%子系统个数
sub_name_fun=cell(1);
for n=1:length(sub_major_role) %主特征循环一次
    sub_major_data=['$MajorRole:',cell2mat(sub_major_role(n))];%当前主特征所在行数字符串
    a_major=strncmp(sub_major_data,data_asy_str,length(sub_major_data));%每行开头查找相同字符串
    b_major=find(a_major);%具有相同主特征，所在行数
    for n1=1:length(sub_minor_role) %次特征循环一次
        sub_minor_data=['$MinorRole:',cell2mat(sub_minor_role(n1))];%当前次特征所在行数字符串
        a_minor=strncmp(sub_minor_data,data_asy_str,length(sub_minor_data));%每行开头查找相同字符串
        b_minor=find(a_minor);%具有相同次特征，所在行数
        for n2=1:length(b_minor) %历遍 相同次特征 的所在行
            b_delta=b_major-b_minor(n2);% 所有主特征行数减去指定次特征行数
            a=find(b_delta==-1);%次特征比主特征高一行，当b_delta为-1时，主次为同一系统
            b=length(sub_minor_data)==...     %整行字符串长度对比 避免 rear和rear_2的混淆
                length(cell2mat(data_asy_str(b_minor(n2))));
            if ~isempty(a)&&b %如果 a、b 皆不为空，则主次特征对应的系统存在
                sub_name=[cell2mat(sub_major_role(n)),'_',...
                    cell2mat(sub_minor_role(n1)),'_name'];%系统变量名称
                a=cell2mat(data_asy_str(b_minor(n2)+2));%次特征行+2为自特征行
                b=strfind(a,'''');%引号''内为子系统名称数据
                c=a((b(1)+1):(b(2)-1));%子系统名称数据
%                 eval([sub_name,'=''',c,''';']);
                n_sub=n_sub+1;
                [a,sub_name1,b]=fileparts(c);
                sub_name_fun(n_sub)=cellstr([sub_name,'=''',sub_name1,''';']);
            end
        end
    end
end
cbd_name=fileparts(fileparts(c));
cbd_name(1)=[];cbd_name(end)=[];% 获得cbd文件夹名称
[a,asy_name,b]=fileparts(asy_addr);%asy名称
clear a b c

end








