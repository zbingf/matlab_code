classdef textClass < handle
    %
    
    properties
        textId
        textAdr
        data
    end
    
    methods
        function obj = textClass(fileAdr)
            obj.textAdr = fileAdr;
            obj.textId = fopen(fileAdr,'r');
        end
        function ReadAll(obj)
            % 读取txt类型数据
            % 输出元胞数据，有空格，有空行
            obj.data = cell(1);
            n1=1;
            while ~feof(obj.textId)
                tline = fgetl(obj.textId);
                obj.data(n1) = cellstr(tline);
                n1 = n1+1;
            end
            obj.data = obj.data';
            fclose(obj.textId);
        end
        function noSpace(obj)
            % 读取txt类型数据
            % 输出元胞数据，无空格，无空行
            obj.data = cell(1);
            n1=1;
            while ~feof(obj.textId)
                tline=fgetl(obj.textId);
                a=find(isspace(tline));
                tline(a)=[];
                if ~length(tline)==0
                    obj.data(n1)=cellstr(tline);
                    n1=n1+1;
                end
            end
            obj.data=obj.data';
            fclose(obj.textId);
        end
        function noSpaceY(obj)
            % 读取txt类型数据
            % 输出元胞数据，有空格，无空行
            obj.data = cell(1);
            n1=1;
            while ~feof(obj.textId)
                tline=fgetl(obj.textId);
                if ~length(tline)==0
                    obj.data(n1)=cellstr(tline);
                    n1=n1+1;
                end
            end
            obj.data=obj.data';
            fclose(obj.textId);
        end
        function noSpaceX(obj)
            % 读取txt类型数据
            % 输出元胞数据，无空格，有空行
            obj.data = cell(1);
            n1=1;
            while ~feof(obj.textId)
                tline=fgetl(obj.textId);
                a=find(isspace(tline));
                tline(a)=[];
                obj.data(n1)=cellstr(tline);
                n1=n1+1;
            end
            obj.data=obj.data';
            fclose(obj.textId);
        end
    end
end


