function data=txt_import_nospace(txt_addr)
% ��ȡtxt��������
% ���Ԫ�����ݣ��޿ո��޿���

txt_id=fopen(txt_addr,'r');
data=cell(1);
n1=1;
while ~feof(txt_id)
    tline=fgetl(txt_id);
    a=find(isspace(tline));
    tline(a)=[];
    if ~length(tline)==0
        data(n1)=cellstr(tline);
        n1=n1+1;
    end
end
data=data';
fclose(txt_id);
end