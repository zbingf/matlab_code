function [data,data_str]=res_importdata(res_addr)
% ����ʱ�� 2017/11/27
% ��ȡres�ļ� ���ļ���Ϊ �ַ�Ԫ����data_str ������ data
% ��ȡ�ٶ�177Mb-34s

% ��ȡ�ļ�
res_id=fopen(res_addr,'r');
%% ��ȡ�ļ���ͷ����
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
%% ��ȡresʣ������
% ����'<Step type="input">'
tline=fgetl(res_id);
data1=[];
while ischar(tline)
    if strncmp('<Step type',tline,3) % ��ͷ
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
%% ��2������
for n=1:10
   tline=fgetl(res_id);
   if strncmp('<Step type',tline,3)
       break
   end
end
% ��ȡ��2������
data2=textscan(res_id,'%f',length(data1));
%% ��ȡʣ�����ݶ�
if ~isempty(cell2mat(data2)) % �ж�����е�2������
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