classdef txtFileRead < handle
    % С�ļ���ȡ������
    properties
        % fileName % �ĵ�����
        filePath
        data
    end
    
    methods
        function obj = txtFileRead
            % ���캯��
        end
        function read(obj)
            % ��ȡ�ļ�
            fileId = fopen(obj.filePath,'r');
%             fseek(fileId,0,'eof');
%             fileLength = ftell(fileId);
%             frewind(fileId);
            n = 1;
%             data1 = cell(fileLength,1);
            while ~feof(fileId)
                tline = fgetl(fileId);
                data1{n,1} = tline;
                n = n+1;
            end
            temp = fclose(fileId);
            if temp == 0
                disp('���ĵ��ɹ��򿪡�')
            end
            obj.data = data1;
        end
        function delDataBlank(obj)
            % ȥ�ո�
            data1 = obj.data;
            for n =1:length(data1)
                data1{n}(isspace(data1{n})) = [];
            end
            obj.data = data1;
        end
        function delLineBlank(obj)
            % ȥ����
            data1 = obj.data;
            n_temp = [];
            for n =1:length(data1)
                tline = data1{n};
                tline(isspace(tline)) = [];
                if isempty(tline)
                    n_temp = [n_temp,n];
                end
            end
            data1(n_temp) = [];
            obj.data = data1;
        end
        function delAllBlank(obj)
            obj.delDataBlank;
            obj.delLineBlank;
        end
        function lower(obj)
            % Сд
            obj.data = lower(obj.data);
        end
        function upper(obj)
            % ��д
            obj.data = upper(obj.data);
        end
        
    end
    
end


