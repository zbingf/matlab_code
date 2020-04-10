% 处理uitable
uitableData = get(handles.uitable1,'data');
nrow = length(uitableData(:,1));
nLoc = false(1,nrow);
for n = 1:nrow
    temp =uitableData{n,2};
    temp = strtrim(temp);
    if isempty(temp)
        nLoc(n) = true;
    end
end
uitableData(nLoc,:) = [];
%
requestLength = length(uitableData(:,2));
configuration = struct;
componentLength = 0;
for n = 1:requestLength
    % request
    request = uitableData{n,2};
    request(find(isspace(request))) = [];
    configuration(n).request = request;
    % component
    component = uitableData{n,3};
    component(find(isspace(component))) = [];
    component_data = strsplit(component,';');
    component_data(cellfun('isempty',component_data)) = [];
    configuration(n).component = component_data;
    % length
    configuration(n).length = length(component_data);
    % minor
    minor = uitableData{n,4};
    minor(find(isspace(minor))) = [];
    minor_data = strsplit(minor,';');
    minor_data(cellfun('isempty',minor_data)) = [];
    if length(minor_data)>1
        for n1 = 1:configuration(n).length
            configuration(n).component_full{n1} = [configuration(n).component{n1},'_',minor_data{n1}];
        end
    elseif isempty(minor_data)
        for n1 = 1:configuration(n).length
            configuration(n).component_full{n1} = configuration(n).component{n1};
        end
    else
        for n1 = 1:configuration(n).length
            configuration(n).component_full{n1} = [configuration(n).component{n1},'_',minor_data{1}];
        end
    end
    componentLength = componentLength+configuration(n).length;
end

data_str = handles.userdata.data_str;
data = handles.userdata.data;
n2 = 1;
data_request = cell(componentLength,1);
data_component = data_request;
data_id = data_request;
for n=1:length(configuration)
    for n1 = 1:length(configuration(n).component_full)
        data_request{n2} = configuration(n).request;
        data_component{n2} = configuration(n).component_full{n1};
        data_id{n2} = [data_request{n2},'.',data_component{n2}];
        n2=n2+1;
    end
end
data_out = res_search_data(data_request,data_component,data_str,data);

dataFull.data_id = data_id;
dataFull.data = data_out;
dataFull.configuration = configuration;

fprintf('>>>>成功生成dataFull<<<<\n')
