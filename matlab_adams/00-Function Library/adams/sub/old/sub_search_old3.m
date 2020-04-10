function  data=sub_search_new2 % (sub_addr)
clear,clc
sub_addr='C:\Users\ABing\Documents\MATLAB\fsae_front_susp.sub';
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_arb.sub';
% 读取sub文件信息（不能读取硬点数据）
% 更新日期：2017/12/02
%% 读取整个sub文档
% 输入：sub_addr
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
% 输出：data_sub_str

%% 数据处理
% 输入：data_sub_str
% 去除 data_sub_str 中的空格
for n=1:length(data_sub_str)
    a=cell2mat(data_sub_str(n));%转化为 字符串
    b=find(isspace(a));%查找空格所在位置
    if ~isempty(b) % 如果纯在空格
        a(b)=[];
    end
    data_sub_str(n)=cellstr(a);% 字符串转化为元胞
end
% 去除 data_sub_str 中的 空行
for n=1:length(data_sub_str)
    c=length(cell2mat(data_sub_str(n)));
    if c==0
        d(n)=1;
    else
        d(n)=0;
    end
end
e=find(d==1);
data_sub_str(e)=[];%删除空元胞
% 输出：data_sub_str
%% major/minor role
major_role=search_in_sub2('[SUBSYSTEM_HEADER]','MAJOR_ROLE',data_sub_str);
minor_role=search_in_sub2('[SUBSYSTEM_HEADER]','MINOR_ROLE',data_sub_str);
major_role=cell2mat(major_role);
minor_role=cell2mat(minor_role);

%% 提取弹簧信息
data.spring_data=spring_search_in_sub(data_sub_str,major_role,minor_role);

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

function spring_data=spring_search_in_sub(data_sub_str,major_role,minor_role)
% 输入：data_sub_str major_role minor_role

% $---------------------------------------------------------------NSPRING_ASSEMBLY
% [NSPRING_ASSEMBLY]
% DEFINITION='.ACAR.forces.ac_spring'
% USAGE='ride_spring1'
% SYMMETRY='left/right' or 'left' or 'right' or 'single'
% PROPERTY_FILE='mdids://fsae_2012/springs.tbl/msc_0001.spr'
% VALUE_TYPE='preload'
% USER_VALUE=2000.0

search_part='[NSPRING_ASSEMBLY]';
search_a=strncmp(search_part,data_sub_str,length(search_part));% 查找 [NSPRING_ASSEMBLY]
line_spr=find(search_a);% [NSPRING_ASSEMBLY] data_sub_str所在行
if ~isempty(line_spr) % 如果有弹簧
    spring_name=search_in_sub2('[NSPRING_ASSEMBLY]','USAGE',data_sub_str);% 弹簧名称
    spring_symmetry=search_in_sub2('[NSPRING_ASSEMBLY]','SYMMETRY',data_sub_str);% 弹簧对称性
    spring_addrA=search_in_sub2('[NSPRING_ASSEMBLY]','PROPERTY_FILE',data_sub_str);% 弹簧文件地址
    % 输出 spring_name spring_addrA spring_symmetry
    % ——————————————————————————
    % 输入：spring_name
    % 弹簧数值赋予（多少对弹簧）
    n_a=1;
    spring_name1=spring_name; % 临时弹簧名称
    for n=1:length(spring_name)
        a=strcmpi(cell2mat(spring_name(n)),spring_name1);%对比spring_name(n)与spring_name1
        b=find(a);%
        if ~isempty(b) % 如果 spring_name(n)在 spring_name1 中找得到,全部赋予数值 n_a
            for n2=1:length(b)
                spring_num(b(n2))=n_a;
                spring_name1(b(n2))={''};%去除 spring_name1中的spring_name(n)
            end
            n_a=n_a+1;% 弹簧数值+1
        end
    end
    clear spring_name1 n_a
    % 输出：spring_num
    spring_num
    % ——————————————————————————
    % 输入 spring_num spring_name spring_addrA
    n_a=1;
    for n=1:length(spring_name)
        if strcmpi('left',cell2mat(spring_symmetry(n)))
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_name=''','nsl_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        elseif strcmpi('right',cell2mat(spring_symmetry(n)))
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_name=''','nsr_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        elseif strcmpi('left/right',cell2mat(spring_symmetry(n)))
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_name=''','nsl_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_left_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
            
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_name=''','nsr_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_right_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        else %单个弹簧
            a=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_single_name=''','nss_',cell2mat(spring_name(n)),''';'];
            b=[major_role,'_',minor_role,...
                '_spring_',num2str(spring_num(n)),'_single_addrA=''',cell2mat(spring_addrA(n)),''';'];
            spring_data(n_a).name_eval=a;
            spring_data(n_a).addrA_eval=b;
            n_a=n_a+1;
        end
    end
    % data.spring_data=spring_data;
else
    spring_data=[];
end
% 输出 spring_data
% spring_data.name_eval
% spring_data.addrA_eval
end