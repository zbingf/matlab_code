function bat_addr=adams2013_search
% 查找 adams2013 的启动文件
% 格式 bat_addr=adams2013_search
% 输出 bat_addr adams2013 bat文件地址

% 函数所在位置
m_adams_addr=which('adams2013_search.m');
% 路径数据txt文件地址
txt_addr=[fileparts(m_adams_addr),'\adams2013_set.txt'];
% 确定根目录
adams_path=adams_path_search(m_adams_addr,txt_addr);
% 定位
bat_addr=bat_addr_search(adams_path);
% 判断地址是否正确
a=exist(bat_addr,'file');% 判断文件是否存在
n1=1;
while ~(a==2)
    % 清空文件并重新写入
    txt_id=fopen(txt_addr,'w+');
    fprintf(txt_id,'error\r\n error\r\n');
    fclose(txt_id);
    % 重新运行确定根目录
    adams_path=adams_path_search(m_adams_addr,txt_addr);
    % 重新定位
    bat_addr=bat_addr_search(adams_path);
    % 判断文件是否存在
    a=exist(bat_addr,'file');
    n1=n1+1;
    if n1>5
        error('adams2013根目录设定过多次，终止程序');
    end
end

end

function adams_path=adams_path_search(m_adams_addr,txt_addr)
if exist(txt_addr,'file')==2
    % 读取文件
    txt_id=fopen(txt_addr,'r');
else
    txt_id=fopen(txt_addr,'w');
    fprintf(txt_id,'error\r\n error\r\n');
    fclose(txt_id);
    txt_id=fopen(txt_addr,'r');
end
tline=fgetl(txt_id);n=1;
while ischar(tline)
    adams2013_set(n)=cellstr(tline);
    n=n+1;
    tline=fgetl(txt_id);
end
fclose(txt_id);
% 对比当前路径与txt文件中记录的文件是否一致
a=strcmpi(m_adams_addr,adams2013_set(1));
if a
    adams_path=cell2mat(adams2013_set(2));
else
    % UI 重新定义根目录
    % UI界面起始位置m_adams_addr
    adams_path=uigetdir(fileparts(m_adams_addr),'选择ADAMS 2013的跟目录');
    if adams_path==0
        error('请选择ADAMS 2013的根目录');
    end
    % 清空文件，并重新写入
    txt1_id=fopen(txt_addr,'w');
    fprintf(txt1_id,'%s \r\n%s \r\n',m_adams_addr,adams_path);
    fclose(txt1_id);
end
end
function bat_addr=bat_addr_search(adams_path)
% 确定adams2013_x64.bat
data_name={'MSC.Software','Adams_x64','2013','bin'};
data=dir(adams_path);
bat_path=[];
for n=1:length(data)
    if strcmpi(cell2mat(data_name(1)),data(n).name)&&data(n).isdir==1
        bat_path=[adams_path,'\',data(n).name,'\Adams_x64\2013\bin'];
        break
    elseif strcmpi(cell2mat(data_name(2)),data(n).name)&&data(n).isdir==1
        bat_path=[adams_path,'\',data(n).name,'\2013\bin'];
        break
    elseif strcmpi(cell2mat(data_name(3)),data(n).name)&&data(n).isdir==1
        bat_path=[adams_path,'\',data(n).name,'\bin'];
        break
    elseif strcmpi(cell2mat(data_name(4)),data(n).name)&&data(n).isdir==1
        bat_path=[adams_path,'\',data(n).name];
        break
    end
end
bat_addr=[bat_path,'\adams2013_x64.bat'];
end