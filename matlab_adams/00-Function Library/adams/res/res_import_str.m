function data=res_import_str(res_adr)
% ����data_str����
% ����res_adr�ļ���ַ
% ���dataԪ��
% 
% 

% ����res�ļ�
data_str=res_import_nospace(res_adr);

% ��ͷ
ans_a='<entityname="';
entity_start=find(strncmp(ans_a,data_str,length(ans_a))==1);
% ans_a='<componentname="';
% componentname_line=strcnmp(ans_a,data_str,length(ans_a));
% ��β
ans_a='</entity>';
entity_end=find(strncmp(ans_a,data_str,length(ans_a))==1);
n3=1;
for n=1:length(entity_start)
    ans_a=find(entity_end>entity_start(n));
    for n1=1:entity_end(ans_a(1))-entity_start(n)-1
        % �м������ݶ�ȡ unitsvalue_name component_name unitsvalue
        tline=cell2mat(data_str(entity_start(n)+n1));
        unitsvalue_name=tline(strfind(tline,'unitsvalue="')+12:strfind(tline,'"id')-1);
        if isempty(unitsvalue_name)
            % �� unitsvalue_name ���� id
            component_name(n3,1)={tline(strfind(tline,'<componentname="')+16:strfind(tline,'"id')-1)};
            unitsvalue(n3,1)={'none'};
        else
            % ��unitsvalue_name ���� unitsvalue_name
            component_name(n3,1)={tline(strfind(tline,'<componentname="')+16:strfind(tline,'"unitsvalue')-1)};
            unitsvalue(n3,1)={unitsvalue_name};
        end
        id(n3,1)={str2num(tline(strfind(tline,'id="')+4:strfind(tline,'"/>')-1))};
        
        % ��ͷ�����ݶ�ȡ entity_name entity enttype objectid
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
% ����res�ļ�
% ����res�ļ���ַ
% ��ȡres���ݣ�ֻ��ȡ��ͷ�ַ����ڼ�������λ
% ���Ԫ�����ݣ��޿ո��޿��С�Сд
% ����ʱ�䣺2018/01/27

% ֻ��ȡ�ļ�
res_id=fopen(res_adr,'r');

data=cell(1);n1=1;
while ~feof(res_id)
    % ��ȡһ��
    tline=fgetl(res_id);
    % ȥ�ո�
    a=find(isspace(tline));
    tline(a)=[];
    % ȥ����
    if ~length(tline)==0
        % Сдת��
        tline=lower(tline);
        % �ж�����
        if strncmp('<steptype="input">',tline,7)
            break
        end
        % ת��ΪԪ��
        data(n1)={tline};
        n1=n1+1;
    end
    
end
% ���� ��תΪ��
data_str=data';
% �ر�
fclose(res_id);

end

