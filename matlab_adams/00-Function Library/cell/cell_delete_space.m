function data=cell_delete_space(data)
% Ԫ���ַ���ȥ�ո�
% �������ַ���

if iscell(data)
    for cols=1:length(data(:,1))
        for rows=1:length(data(1,:))
            if ischar(data{cols,rows})
                % ֻ�����ַ���
                data{cols,rows}(isspace(data{cols,rows}))=[];
            end
        end
    end
else
    warning('cell_delete_space����ֻ֧��Ԫ��')
end
end