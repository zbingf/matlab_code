classdef sub_file < handle
    % sub文件检索
    properties
        sub_adr
        data_sub
        springs
        springall
        dampers
        damperall
    end
    methods
        function obj = sub_file(txt_adr)
            % 构造函数
            openfile(obj,txt_adr)
            spring_search(obj)
            damper_search(obj)
            spring_split(obj)
            damper_split(obj)
        end
        function openfile(obj,txt_adr)
            % 打开文件并处理数据（去空格 空行 小写）
            % 存储数据为 data_asy_str (空格)
            obj.sub_adr = txt_adr;
            txt_id = fopen(txt_adr,'r');
            data = cell(1);
            n=1;
            while ~feof(txt_id)
                tline = fgetl(txt_id);
                tline(isspace(tline)) = [];
                if ~length(tline) == 0
                    data(n) = {tline};
                    n=n+1;
                end
            end
            data = data';
            fclose(txt_id);
            data = lower(data); % 小写
            obj.data_sub = data;
            
        end
        
        function spring_search(obj)
            % 检索 spring
            data = obj.data_sub;
            logical_a = strncmp(data,'[nspring_assembly]',18);
            line_a = find(logical_a);
            if ~isempty(line_a)
                for n = 1:length(line_a)
                    springs_a(n).definition = data{line_a(n)+1}(13:end-1);
                    springs_a(n).usage = data{line_a(n)+2}(8:end-1);
                    springs_a(n).symmetry = data{line_a(n)+3}(11:end-1);
                    springs_a(n).property_file = data{line_a(n)+4}(16:end-1);
                end
            else
                springs_a = [];
            end
            obj.springs = springs_a;
        end
        
        function damper_search(obj)
            % 检索 damper
            data = obj.data_sub;
            logical_a = strncmp(data,'[damper_assembly]',17);
            line_a = find(logical_a);
            if ~isempty(line_a)
                for n = 1:length(line_a)
                    dampers_a(n).definition = data{line_a(n)+1}(13:end-1);
                    dampers_a(n).usage = data{line_a(n)+2}(8:end-1);
                    dampers_a(n).symmetry = data{line_a(n)+3}(11:end-1);
                    dampers_a(n).property_file = data{line_a(n)+4}(16:end-1);
                end
            else
                dampers_a = [];
            end
            obj.dampers = dampers_a;
        end
        
        function spring_split(obj)
            % 将对称 spring 区分开
            springs_a = obj.springs;
            obj.springall = split_symmetry(springs_a);
        end
        
        function damper_split(obj)
            % 将对称 damper 区分开
            dampers_a = obj.dampers;
            obj.damperall = split_symmetry(dampers_a);
        end
    end
    
end

function data_split = split_symmetry(data)
% 检索对称性，并区分开
data_split = data;
if ~isempty(data)
    for n = 1:length(data)
        if strcmpi(data(n).symmetry,'left/right')
            data_a = data_split(n);
            data_a.symmetry = 'right';
            data_split(n).symmetry = 'left';
            data_split = [data_split,data_a];
        end
    end
end
end
