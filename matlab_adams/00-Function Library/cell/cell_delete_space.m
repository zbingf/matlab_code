function data=cell_delete_space(data)
% 元胞字符串去空格
% 仅处理字符串

if iscell(data)
    for cols=1:length(data(:,1))
        for rows=1:length(data(1,:))
            if ischar(data{cols,rows})
                % 只处理字符串
                data{cols,rows}(isspace(data{cols,rows}))=[];
            end
        end
    end
else
    warning('cell_delete_space函数只支持元胞')
end
end