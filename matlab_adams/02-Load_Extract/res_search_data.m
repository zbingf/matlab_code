function data_out = res_search_data(request_name,component_name,data_str,data)

data_str = lower(data_str);
request_name = lower(request_name);
component_name = lower(component_name);
for n = 1:length(data_str)
    data_str{n}(find(isspace(data_str{n})))=[];
end

if ischar(request_name) && ischar(component_name)
    data_id = res_search_id(request_name,component_name,data_str);
else
    for n = 1:length(request_name)
       data_id(n) = res_search_id(request_name{n},component_name{n},data_str);
    end
end
data_out = data(:,data_id);

end

function id_n = res_search_id(name_1,name_2,data_str)
    name_data = ['<entityname="',name_1,'"'];
    name_data2 = ['<componentname="',name_2,'"'];
    a = strncmp(name_data,data_str,length(name_data));
    b = strncmp('</entity>',data_str,length('</entity>'));
    a1 = find(a==1);
    b1 = find(b==1);
    for n = 1:length(a1)
        b2 = find(b1>a1(n));
        b3 = b1(b2(1));
        c = strncmp(name_data2,data_str(a1(n):b3),length(name_data2));
        c1 = find(c==1);
        if ~isempty(c1)
            d = data_str{a1(n)+c1-1};
            id_n = str2double(d(strfind(d,'id="')+4:strfind(d,'"/>')-1));
            break
        end
    end
end