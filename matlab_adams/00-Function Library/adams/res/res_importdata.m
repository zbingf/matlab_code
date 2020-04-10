function [data,data_str]=res_importdata(res_addr)
% 更新时间 2017/11/27
% 读取res文件 将文件分为 字符元胞组data_str 和数组 data
% 读取速度177Mb-34s

% 读取文件
res_id=fopen(res_addr,'r');
%% 读取文件开头数据
data_str=cell(1);
tline=fgetl(res_id);
n1=1;
while ischar(tline)
    data_str(n1)=cellstr(tline);
    n1=n1+1;
    if strncmp('<Step type="input">',tline,7)
        break
    end
    tline=fgetl(res_id);
end
data_str=data_str';
%% 读取res剩余数据
% 跳过'<Step type="input">'
tline=fgetl(res_id);
data1=[];
while ischar(tline)
    if strncmp('<Step type',tline,3) % 开头
        tline=fgetl(res_id);
        while ischar(tline)
            if strncmp('</Step',tline,3)
                break
            end
            data1=[data1,str2num(tline)];
            tline=fgetl(res_id);
        end
        data(1,:)=data1;
        break
    end
    tline=fgetl(res_id);
end
%% 第2段数据
for n=1:10
   tline=fgetl(res_id);
   if strncmp('<Step type',tline,3)
       break
   end
end
% 读取第2段数据
data2=textscan(res_id,'%f',length(data1));
%% 读取剩余数据段
if ~isempty(cell2mat(data2)) % 判断书否有第2段数据
    data(2,:)=cell2mat(data2)';
    n2=3;
    while ischar(tline)
        data2=textscan(res_id,'%f',length(data1));
        if ~isempty(data2{1})
            data(n2,:)=data2{1}';
            n2=n2+1;
        else
            tline=fgetl(res_id);
        end
    end
end
fclose(res_id);
   
end