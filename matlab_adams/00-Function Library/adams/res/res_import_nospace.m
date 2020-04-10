function data=res_import_nospace(res_adr)
% 用于res文件
% 输入res文件地址
% 读取res数据，只读取开头字符用于检索、定位
% 输出元胞数据，无空格、无空行、小写
% 更新时间：2018/01/27

% 只读取文件 
res_id=fopen(res_adr,'r');

data=cell(1);n1=1;
while ~feof(res_id)
    % 读取一行
    tline=fgetl(res_id);
    % 去空格
    a=find(isspace(tline));
    tline(a)=[];
    % 去空行
    if ~length(tline)==0
        % 小写转化
        tline=lower(tline);
        % 中断条件
        if strncmp('<steptype="input">',tline,7)
            break
        end
        % 转化为元胞
        data(n1)={tline};
        n1=n1+1;
    end
    
end
% 倒置 行转为列
data=data';
% 关闭
fclose(res_id);

end
