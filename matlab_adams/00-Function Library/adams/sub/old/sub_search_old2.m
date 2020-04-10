clear,clc
sub_addr='C:\Users\ABing\Documents\MATLAB\fsae_front_susp.sub';
% sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_arb.sub';
% 读取sub文件信息（不能读取硬点数据）
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
search_part='[SUBSYSTEM_HEADER]';
a=strncmp(search_part,data_sub_str,length(search_part));% 查找 [SUBSYSTEM_HEADER]
b=find(a);% [SUBSYSTEM_HEADER] 所在行
c=cell2mat(data_sub_str(b+2));
d=strfind(c,'''');
major_role=c(d(1)+1:d(2)-1);
c=cell2mat(data_sub_str(b+3));
d=strfind(c,'''');
minor_role=c(d(1)+1:d(2)-1);

%% 提取弹簧信息
% 输入：data_sub_str
% 不考虑单个弹簧
search_part='[NSPRING_ASSEMBLY]';
a=strncmp(search_part,data_sub_str,length(search_part));% 查找 [DAMPER_ASSEMBLY]
a_spr=find(a);% [DAMPER_ASSEMBLY] data_sub_str所在行
data_spr_str=cell(7,length(a_spr));% 预设 弹簧信息 元胞组 (每组子系统信息 7行)
if ~isempty(a_spr)
    for n=1:length(a_spr)
        data_spr_str(:,n)=data_sub_str(a_spr(n):a_spr(n)+6);
    end
    for n=1:length(data_spr_str(1,:))
        % spring_name
        a=cell2mat(data_spr_str(3,n));% 第3行 USAGE='spring_name';
        a1=strfind(a,'''');
        spring_name(n)=cellstr(a(a1(1)+1:a1(2)-1)); % spring_name 元胞
        % SYMMETRY 对称性
        b=cell2mat(data_spr_str(4,n));% 第4行 SYMMETRY='left/right'or'left'or'right'
        b1=strfind(b,'''');
        spring_symmetry(n)=cellstr(b(b1(1)+1:b1(2)-1)); % 弹簧对称性
        % PROPERTY_FILE 文件位置addrA
        % PROPERTY_FILE='mdids://fsae_2012/springs.tbl/msc_0001.spr'
        c=cell2mat(data_spr_str(5,n));% 第5行 
        c1=strfind(c,'''');
        spring_addrA(n)=cellstr(c(c1(1)+1:c1(2)-1)); % 弹簧对称性
        clear a b c a1 b1 c1
    end
    c=[];
    for n=1:length(spring_name)
        a=strcmpi(cell2mat(spring_name(n)),spring_name);
        b=find(a);
        if length(b)>1
            c(n)=b(2);
        end
    end
    c=unique(c);
    spring_name(c)=[];
    spring_symmetry(c)=[];
    
    if length(spring_name)>1 %如果不只一对弹簧
        for n=1:length(spring_name)
            a=strfind(cell2mat(spring_name(n)),'front');
            b=strfind(cell2mat(spring_name(n)),'rear');
            if ~isempty(a)
                c=[major_role,'_',minor_role,...
                    '_spring_front_name=','''',cell2mat(spring_name(n)),''''];
                spring_name_eval(n)=cellstr(c);
            elseif ~isempty(b)
                c=[major_role,'_',minor_role,...
                    '_spring_rear_name=','''',cell2mat(spring_name(n)),''''];
                spring_name_eval(n)=cellstr(c);
            else
                warning('——弹簧名称出错——检查模板弹簧名称')
            end
        end
        if length(spring_name)>2
            error('弹簧数超过2对，程序不适用')
        end
    else
        c=[major_role,'_',minor_role,...
            '_spring_name=','''',cell2mat(spring_name),''''];
        spring_name_eval=cellstr(c);
    end
end
% 输出
% spring_name_eval

%% 提取减震器信息
