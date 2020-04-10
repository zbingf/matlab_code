function data=txt_import(txt_addr)
% 读取txt类型数据
% 输出元胞数据，有空格，有空行

txt_id=fopen(txt_addr,'r');
data=cell(1);
n1=1;
while ~feof(txt_id)
    tline=fgetl(txt_id);
    data(n1)=cellstr(tline);
    n1=n1+1;
end
data=data';
fclose(txt_id);
end