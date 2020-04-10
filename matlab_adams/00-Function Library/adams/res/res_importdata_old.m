function [data,data_str]=res_importdata(res_addr)
%读取res文件（ADAMS后处理文件）
%将其分成两部分：开头字符（包含个数据的id）、数据
    fid=fopen(res_addr);
    %——————————————————————
    %读取res文件开头数据
    for n=1:1:1
        data_str=cell(1);
        tline=fgetl(fid);
        n1=1;
        while ischar(tline)
            data_str(n1)=cellstr(tline);
            n1=n1+1;
            if strncmp('<Step type="input">',tline,7)
                break
            end
            tline=fgetl(fid);        
        end
        data_str=data_str';
    end
    %读取res文件剩余数据
    tline=fgetl(fid);%跳过<Step type="input">
    data1=[];
    while ischar(tline) %读取第一组数据
        if strncmp('<Step type=',tline,3)
            tline=fgetl(fid);
            while ischar(tline)
                data1=[data1,str2double(tline)];
                tline=fgetl(fid);
                if strncmp('</Step>',tline,3)
                    break
                end
            end
            break
        end
        tline=fgetl(fid); 
    end
    data(1,:)=data1;
    n2=2;
    while ischar(tline)
        data2=cell2mat(textscan(fid,'%f',length(data1)));
        if ~isempty(data2)
            data(n2,:)=data2;
            n2=n2+1;
        end
        tline=fgetl(fid); 
    end
end