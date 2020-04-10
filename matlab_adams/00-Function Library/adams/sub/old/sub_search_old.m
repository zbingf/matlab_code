function  spring_name_fun=sub_search(sub_addr)
% clear,clc
% a为临时变量
% sub_search
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_susp.sub';
sub_id=fopen(sub_addr,'r');
%————————————
% 读取数据
data_sub_str=cell(1);
tline=fgetl(sub_id);
n=1;
while ischar(tline)
    data_sub_str(n)=cellstr(tline);
    n=n+1;
    tline=fgetl(sub_id);
end
data_sub_str=data_sub_str';
fclose(sub_id);
%————————————
% 数据处理
% 去除 data_sub_str 中的空格
for n=1:length(data_sub_str)
    a=cell2mat(data_sub_str(n));%读取第n行
    b=find(isspace(a));%查找空格所在位置
    if ~isempty(b) %空格存在
        a(b)=[];%将第n行中对应空格位置设置为[]，即删除掉
    end
    data_sub_str(n)=cellstr(a);%将处理完的第n行存储到data_sub_str第n个元胞中
end
a=find(strncmp('',data_sub_str,3));%查找空行
a=int32(a);
data_sub_str(a)=[];%删除空元胞
clear a b;
%————————————
%查找主特征
major_role=search_in_sub('MAJOR_ROLE',data_sub_str);
%查找次特征
minor_role=search_in_sub('MINOR_ROLE',data_sub_str);
%————————————
%查找弹簧名称 输出数组有可能为多组
spring_name=search_in_sub2('[NSPRING_ASSEMBLY]','USAGE',data_sub_str);
spring_name_fun=cell(1);
if length(spring_name)==2
    for n=1:length(spring_name)
        a=strfind(cell2mat(spring_name(n)),'front');
        b=strfind(cell2mat(spring_name(n)),'rear');
        if ~isempty(a)
            c=[major_role,'_',minor_role,...
                '_spring_rear_front=','''',cell2mat(spring_name(n)),''''];
            spring_name_fun(n)=cellstr(c);
        elseif ~isempty(b)
            c=[major_role,'_',minor_role,...
                '_spring_rear_name=','''',cell2mat(spring_name(n)),''''];
            spring_name_fun(n)=cellstr(c);
        else
            warning('——弹簧名称出错——检查模板弹簧名称')
        end
    end
elseif length(spring_name)==1
    c=[major_role,'_',minor_role,...
        '_spring_name=','''',cell2mat(spring_name),''''];
    spring_name_fun=cellstr(c);
else
    warning('——sub中弹簧数量超出2组（设置默认一组两个左右对称）——')
end

end

function name=search_in_sub(search_name,data_str)
% 数据源 data_sub_str 元胞
% 输出name为 字符
% 适用于搜索 search_name='name'格式
a=strncmp(search_name,data_str,length(search_name));%判断每行是否包含search_name
b=find(a==1);%查找所在行
b=int32(b);
c=cell2mat(data_str(b));%转化所在行元胞为字符串
d=strfind(c,'''');%查找所在行中的‘’字符
name=c(d(1)+1:d(2)-1);% 字符‘’内为minor_role
end

function name=search_in_sub2(header_name,search_name,data_str)
% 数据源 data_sub_str 元胞
% 输出 name 为元胞
% 适用于搜索以下格式
% $------------------------------
% [header_name]
% search_name='name'格式
% $------------------------------(改行计算中被排除)
a=strncmp(header_name,data_str,length(header_name));
b=find(a==1);
if ~isempty(b) %如果 header_name 存在
    c=strncmp('$',data_str,1);%数据段隔开标志‘$’
    d=find(c==1);% '$'所在行数
    name=cell(1);
    for n=1:length(b) % 第n组 header_name
        e=find(d<b(n)); %数据段 [NSPRING_ASSEMBLY]开头 e(f(end))
        f=find(d>b(n)); %数据段 [NSPRING_ASSEMBLY]结尾 e(g(1))-1
        g=data_str(d(e(end)):d(f(1))-1);%数据段-元胞组
        if isempty(f) %如果数据段为最后一个的话，结尾部分无 “$”
            g=data_str(d(e(end)):d(end));%数据段-元胞组
        end
        name(n)={search_in_sub(search_name,g)};%元胞 search_name所在名称 调用search_in_sub
        clear e f g
    end
end
end