function [data,data_str]=res_importdata(res_addr)
%��ȡres�ļ���ADAMS�����ļ���
%����ֳ������֣���ͷ�ַ������������ݵ�id��������
    fid=fopen(res_addr);
    %��������������������������������������������
    %��ȡres�ļ���ͷ����
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
    %��ȡres�ļ�ʣ������
    tline=fgetl(fid);%����<Step type="input">
    data1=[];
    while ischar(tline) %��ȡ��һ������
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