function data=res_import_str(res_adr)
% 处理data_str数据
% 输入res_adr文件地址
% 输出data元胞
% 
% 

% 导入res文件
data_str=res_import_nospace(res_adr);

% 开头
ans_a='<entityname="';
entity_start=find(strncmp(ans_a,data_str,length(ans_a))==1);
% ans_a='<componentname="';
% componentname_line=strcnmp(ans_a,data_str,length(ans_a));
% 结尾
ans_a='</entity>';
entity_end=find(strncmp(ans_a,data_str,length(ans_a))==1);
n3=1;
for n=1:length(entity_start)
    ans_a=find(entity_end>entity_start(n));
    for n1=1:entity_end(ans_a(1))-entity_start(n)-1
        % 中间行数据读取 unitsvalue_name component_name unitsvalue
        tline=cell2mat(data_str(entity_start(n)+n1));
        unitsvalue_name=tline(strfind(tline,'unitsvalue="')+12:strfind(tline,'"id')-1);
        if isempty(unitsvalue_name)
            % 无 unitsvalue_name 接上 id
            component_name(n3,1)={tline(strfind(tline,'<componentname="')+16:strfind(tline,'"id')-1)};
            unitsvalue(n3,1)={'none'};
        else
            % 有unitsvalue_name 接上 unitsvalue_name
            component_name(n3,1)={tline(strfind(tline,'<componentname="')+16:strfind(tline,'"unitsvalue')-1)};
            unitsvalue(n3,1)={unitsvalue_name};
        end
        id(n3,1)={str2num(tline(strfind(tline,'id="')+4:strfind(tline,'"/>')-1))};
        
        % 开头行数据读取 entity_name entity enttype objectid
        tline2=cell2mat(data_str(entity_start(n)));
        
        entity_name(n3,1) = {tline2(strfind(tline2,'<entityname="')+13:strfind(tline2,'"entity')-1)};
        entity(n3,1) = {tline2(strfind(tline2,'entity="')+8:strfind(tline2,'"enttype')-1)};
        enttype(n3,1) = {tline2(strfind(tline2,'enttype="')+9:strfind(tline2,'"objectid')-1)};
        objectid(n3,1) = {str2num(tline2(strfind(tline2,'objectid="')+10:strfind(tline2,'">')-1))};
        
        n3=n3+1;
    end
end
data=[entity_name,entity,enttype,objectid,component_name,unitsvalue,id];
end


function data_str=res_import_nospace(res_adr)
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
data_str=data';
% 关闭
fclose(res_id);

end

