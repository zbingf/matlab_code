classdef FileHandle < handle
    % �ļ���ȡ������
    
    properties
        file % �ĵ�����
        data_now
        data_old
        data_initial
    end
    
    methods
        function obj = FileHandle(file_adr)
            % ���캯��
            obj.file.adr = file_adr;
            [a,name,c] = fileparts(file_adr);
            obj.file.name = name;
        end
        function Read(obj)
            % ��ȡ�ļ�
            id = fopen(obj.file.adr,'r');
            n = 1;data = cell(1);
            while ~feof(id)
                tline = fgetl(id);
                data{n} = tline;
                n = n+1;
            end
            temp = fclose(id);
            if temp == 0
                disp('���ĵ��ɹ��رա�')
            end
            data = data';
            obj.data_now = data;
            obj.data_old = data;
            obj.data_initial = data;
        end
        function Nspace(obj)
            % ȥ�ո�
            data = obj.data_now;
            for n =1:length(data)
                data{n}(isspace(data{n})) = [];
            end
            obj.data_now = data;
        end
        function Nline(obj)
            % ȥ����
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
            % Сд
            obj.data_now = lower(obj.data_now);
        end
        function Upper(obj)
            % ��д
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


