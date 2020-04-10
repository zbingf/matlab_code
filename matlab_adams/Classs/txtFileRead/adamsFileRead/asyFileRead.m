classdef asyFileRead < txtFileRead
    % 小文件读取、处理
    properties
        % filePath
        % data
        asyData
    end
    
    methods
        function obj = asyFileRead
            disp('》asyFileRead--继承于--txtFileRead《')
            % 构造函数
            obj = obj@txtFileRead;
        end
        function asyRead(obj)
            obj.read;
            obj.delDataBlank;
            obj.delLineBlank;
            obj.lower;
            data1 = obj.data;
            n = 1;
            n_subsystem = 1;
            while 1
                if strfind(data1{n},lower('[ASSEMBLY_HEADER]'))
                    temp = strfind(data1{n+1},'''');
                    asyData1.assembly_header.assembly_class = data1{n+1}(temp(1)+1:temp(2)-1);
                    temp = strfind(data1{n+2},'''');
                    asyData1.assembly_header.timestamp = data1{n+2}(temp(1)+1:temp(2)-1);
                end
                if strfind(data1{n},lower('[PLUGINS]'))
                    temp = strfind(data1{n+1},'''');
                    asyData1.plugins.plugin_list = data1{n+1}(temp(1)+1:temp(2)-1);
                end
                if strfind(data1{n},lower('[UNITS]'))
                    temp = strfind(data1{n+1},'''');
                    asyData1.units.length = data1{n+1}(temp(1)+1:temp(2)-1);
                    temp = strfind(data1{n+2},'''');
                    asyData1.units.force = data1{n+2}(temp(1)+1:temp(2)-1);
                    temp = strfind(data1{n+3},'''');
                    asyData1.units.angle = data1{n+3}(temp(1)+1:temp(2)-1);
                    temp = strfind(data1{n+4},'''');
                    asyData1.units.mass = data1{n+4}(temp(1)+1:temp(2)-1);
                    temp = strfind(data1{n+5},'''');
                    asyData1.units.time = data1{n+5}(temp(1)+1:temp(2)-1);
                end
                if strfind(data1{n},lower('[SUBSYSTEM]'))
                    temp = strfind(data1{n+2},':');
                    asyData1.subsystem(n_subsystem).major_role = data1{n+2}(temp(1)+1:end);
                    temp = strfind(data1{n+3},':');
                    asyData1.subsystem(n_subsystem).minor_role = data1{n+3}(temp(1)+1:end);
                    temp = strfind(data1{n+4},':');
                    asyData1.subsystem(n_subsystem).template = data1{n+4}(temp(1)+1:end);
                    temp = strfind(data1{n+5},'''');
                    asyData1.subsystem(n_subsystem).usage = data1{n+5}(temp(1)+1:temp(2)-1);
                    n_subsystem = n_subsystem + 1;
                end
                if strfind(data1{n},lower('[TESTRIG]'))
                    temp = strfind(data1{n+1},'''');
                    asyData1.testrig.usage = data1{n+1}(temp(1)+1:temp(2)-1);
                end
                if strfind(data1{n},lower('[HARDPOINT]'))
                    
                end
                if strfind(data1{n},lower('[PARAMETER]'))
                    
                end
                if strfind(data1{n},lower('[SOLVER_SETTINGS]'))
                    
                end
                if exist('asyData1')
                    obj.asyData = asyData1;
                end
                % 终止条件
                n = n+1;
                if n == length(data1)
                    break
                end
            end
        end
        
        
    end
    
end


