function run_bat_to_get_res
% (cmd_addr,m_path,bat_addr)
m_path='C:\Users\ABing\Documents\MATLAB\01-matlab_adams';
bat_addr=adams2013_search;
cmd_addr='G:\05_For_adams\test.cmd';
% 运行cmd文件，运算得到res文件，删除其他文件
% 事先删除同名文件，避免仿真失败

% 读取cmd文件内容，无空格、无空行
data_cmd=txt_import_nospace(cmd_addr);

m_dir=dir(m_path);
n1=1;
for n=1:length(m_dir)
    if m_dir(n).isdir==0
        m_dir_files(n1)={m_dir(n).name};
        n1=n1+1;
    end
end
% ————查找cmd文件仿真文件名字设置位置————
% 仿真文件名-所在行数
name_id=find(strncmp(data_cmd,'output_prefix=',13)==1);
if ~isempty(name_id)
    for n=1:length(name_id)
        output_name1=cell2mat(data_cmd(name_id(n)));
        name_id2=strfind(output_name1,'"');
        name_id3=strfind(output_name1,'=');
        name_id4=strfind(output_name1,'&');
        if ~isempty(name_id2)
            output_name=output_name1(name_id2(1)+1:name_id(2)-1);
        elseif ~isempty(name_id4)
            output_name=output_name1(name_id3(1)+1:name_id4-1);
        else
            output_name=output_name1(name_id3(1)+1:end);
        end
        % ————提前删除重名文件，避免仿真失败————
        a=strncmpi(m_dir_files,[output_name,'_'],length(output_name)+1);
        m_dir_files_0=m_dir_files;
        m_dir_files_0(~a)=[];
        b=find(a==1);
        if ~isempty(b)
            for n2=1:length(b)
                disp(['——文件',cell2mat(m_dir_files_0(n2)),'与仿真名称相近进行删除，保证仿真运行——']);
                delete([m_path,'\',cell2mat(m_dir_files_0(n2))]);
            end
        end
    end
else
    disp('——仿真中无仿真命令流——');
end

% ——运行cmd文件——
dos_str=[bat_addr,' acar ru-standard b ',cmd_addr];
%运行
dos(dos_str);
disp('——ADAMS运行结束——')

% ——删除仿真多余文件——
delete_path=[m_path,'\'];
delete_file=['*.log';'*.acf';'*.loq';'*.bat';'*.mtx';...
    '*.asv';'*.adm';'*.msg';'*.sdl';'*.xml';'*.req';'*.nam'];
for n=1:length(delete_file)
    delete_id=[delete_path,delete_file(n,:)];
    delete(delete_id);
    delete_id=[];
end

end
