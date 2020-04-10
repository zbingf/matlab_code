function bat_addr=adams2013_search
% ���� adams2013 �������ļ�
% ��ʽ bat_addr=adams2013_search
% ��� bat_addr adams2013 bat�ļ���ַ

% ��������λ��
m_adams_addr=which('adams2013_search.m');
% ·������txt�ļ���ַ
txt_addr=[fileparts(m_adams_addr),'\adams2013_set.txt'];
% ȷ����Ŀ¼
adams_path=adams_path_search(m_adams_addr,txt_addr);
% ��λ
bat_addr=bat_addr_search(adams_path);
% �жϵ�ַ�Ƿ���ȷ
a=exist(bat_addr,'file');% �ж��ļ��Ƿ����
n1=1;
while ~(a==2)
    % ����ļ�������д��
    txt_id=fopen(txt_addr,'w+');
    fprintf(txt_id,'error\r\n error\r\n');
    fclose(txt_id);
    % ��������ȷ����Ŀ¼
    adams_path=adams_path_search(m_adams_addr,txt_addr);
    % ���¶�λ
    bat_addr=bat_addr_search(adams_path);
    % �ж��ļ��Ƿ����
    a=exist(bat_addr,'file');
    n1=n1+1;
    if n1>5
        error('adams2013��Ŀ¼�趨����Σ���ֹ����');
    end
end

end

function adams_path=adams_path_search(m_adams_addr,txt_addr)
if exist(txt_addr,'file')==2
    % ��ȡ�ļ�
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
% �Աȵ�ǰ·����txt�ļ��м�¼���ļ��Ƿ�һ��
a=strcmpi(m_adams_addr,adams2013_set(1));
if a
    adams_path=cell2mat(adams2013_set(2));
else
    % UI ���¶����Ŀ¼
    % UI������ʼλ��m_adams_addr
    adams_path=uigetdir(fileparts(m_adams_addr),'ѡ��ADAMS 2013�ĸ�Ŀ¼');
    if adams_path==0
        error('��ѡ��ADAMS 2013�ĸ�Ŀ¼');
    end
    % ����ļ���������д��
    txt1_id=fopen(txt_addr,'w');
    fprintf(txt1_id,'%s \r\n%s \r\n',m_adams_addr,adams_path);
    fclose(txt1_id);
end
end
function bat_addr=bat_addr_search(adams_path)
% ȷ��adams2013_x64.bat
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