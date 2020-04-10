function run_bat_to_get_res
% (cmd_addr,m_path,bat_addr)
m_path='C:\Users\ABing\Documents\MATLAB\01-matlab_adams';
bat_addr=adams2013_search;
cmd_addr='G:\05_For_adams\test.cmd';
% ����cmd�ļ�������õ�res�ļ���ɾ�������ļ�
% ����ɾ��ͬ���ļ����������ʧ��

% ��ȡcmd�ļ����ݣ��޿ո��޿���
data_cmd=txt_import_nospace(cmd_addr);

m_dir=dir(m_path);
n1=1;
for n=1:length(m_dir)
    if m_dir(n).isdir==0
        m_dir_files(n1)={m_dir(n).name};
        n1=n1+1;
    end
end
% ������������cmd�ļ������ļ���������λ�á�������
% �����ļ���-��������
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
        % ����������ǰɾ�������ļ����������ʧ�ܡ�������
        a=strncmpi(m_dir_files,[output_name,'_'],length(output_name)+1);
        m_dir_files_0=m_dir_files;
        m_dir_files_0(~a)=[];
        b=find(a==1);
        if ~isempty(b)
            for n2=1:length(b)
                disp(['�����ļ�',cell2mat(m_dir_files_0(n2)),'����������������ɾ������֤�������С���']);
                delete([m_path,'\',cell2mat(m_dir_files_0(n2))]);
            end
        end
    end
else
    disp('�����������޷�������������');
end

% ��������cmd�ļ�����
dos_str=[bat_addr,' acar ru-standard b ',cmd_addr];
%����
dos(dos_str);
disp('����ADAMS���н�������')

% ����ɾ����������ļ�����
delete_path=[m_path,'\'];
delete_file=['*.log';'*.acf';'*.loq';'*.bat';'*.mtx';...
    '*.asv';'*.adm';'*.msg';'*.sdl';'*.xml';'*.req';'*.nam'];
for n=1:length(delete_file)
    delete_id=[delete_path,delete_file(n,:)];
    delete(delete_id);
    delete_id=[];
end

end
