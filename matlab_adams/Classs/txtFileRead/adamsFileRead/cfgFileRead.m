classdef cfgFileRead < txtFileRead
    % 小文件读取、处理
    properties
        % filePath
        % data
        cfgData
    end
    
    methods
        function obj = cfgFileRead
            disp('》cfgFileRead--继承于--txtFileRead《')
            % 构造函数
            obj = obj@txtFileRead;
        end
        function cfgRead(obj)
            obj.read;
            obj.delLineBlank;
            data1 = obj.data;
            n = 1;
            temp = strcmpi(data1,'!');
            data1(temp) = [];
            n_data = 1;
            while 1
                data2 = strtrim(data1{n});
                if strfind(data2,('DATABASE'))==1
                    temp = strfind(data2,' ');
                    temp1 = diff(temp);
                    temp2 = temp(find(temp1>1));
                    if length(temp2)>1
                        cfgData1.database(n_data).name = strtrim(data2(temp2(1):temp2(2)));
                        cfgData1.database(n_data).path = strtrim(data2(temp2(2):end));
                    else
                        cfgData1.database(n_data).name = strtrim(data2(temp2(1):temp(end)));
                        cfgData1.database(n_data).path = strtrim(data2(temp(end):end));
                    end
                    n_data = n_data+1;
                end
                % 终止条件
                n = n+1;
                if n == length(data1)
                    break
                end
            end
            obj.cfgData = cfgData1;
        end
        
        
    end
    
end


