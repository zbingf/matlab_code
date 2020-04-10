function data=txt_import_nospace_x(txt_addr)
% 读取txt类型数据
% 输出元胞数据，无空格、有空行

txt_id=fopen(txt_addr,'r');
data=cell(1);
n1=1;
while ~feof(txt_id)
    tline=fgetl(txt_id);
    a=find(isspace(tline));
    tline(a)=[];
    data(n1)=cellstr(tline);
    n1=n1+1;
end
data=data';
fclose(txt_id);
end