classdef FileHandle < handle
    % 文件读取、处理
    
    properties
        file % 文档属性
        data_now
        data_old
        data_initial
    end
    
    methods
        function obj = FileHandle(file_adr)
            % 构造函数
            obj.file.adr = file_adr;
            [a,name,c] = fileparts(file_adr);
            obj.file.name = name;
        end
        function Read(obj)
            % 读取文件
            id = fopen(obj.file.adr,'r');
            n = 1;data = cell(1);
            while ~feof(id)
                tline = fgetl(id);
                data{n} = tline;
                n = n+1;
            end
            temp = fclose(id);
            if temp == 0
                disp('》文档成功关闭《')
            end
            data = data';
            obj.data_now = data;
            obj.data_old = data;
            obj.data_initial = data;
        end
        function Nspace(obj)
            % 去空格
            data = obj.data_now;
            for n =1:length(data)
                data{n}(isspace(data{n})) = [];
            end
            obj.data_now = data;
        end
        function Nline(obj)
            % 去空行
            data = obj.data_now;
            data1 = data;n1 = 1;
            for n =1:length(data)
                tline = data{n};
                tline(isspace(tline)) = [];
                if isempty(tline)
                    data1(n1) = [];
                    n1 = n1-1;
                end
                n1 = n1+1;
            end
            obj.data_now = data1;
        end
        function Lower(obj)
            % 小写
            obj.data_now = lower(obj.data_now);
        end
        function Upper(obj)
            % 大写
            obj.data_now = upper(obj.data_now);
        end
        
        function Write(obj)
        
        end
        function WriteAdd(obj)
        
        end
        function WriteBack(obj)
        
        end
        function Getback(obj)
            obj.data_now = obj.data_old;
        end
        function Updata(obj)
            obj.data_old = obj.data_now;
        end
    end
    
end


