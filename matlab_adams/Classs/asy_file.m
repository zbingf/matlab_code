classdef asy_file < handle
    % asy 文件检索
    properties
        asy_adr % asy文件地址
        asy_name % asy 文件名称
        asy_class % asy 类型
        testrig % 试验台架类型
        cbd_name % 文件所在cbd 文件夹名称
        cbd_path % asy 所在cbd 路径
        data_asy % asy 文件内容（元胞）
        subsdata % asy 文件内 各个子系统 类型（结构体）
    end
    
    methods
        function obj = asy_file(txt_adr)
            % 构造函数
            openfile(obj,txt_adr)
            subssystem(obj)
            asyname(obj)
            assembly_class(obj)
            asytestrig(obj)
        end
        
        function openfile(obj,txt_adr)
            % 打开文件并处理数据（去空格 空行 小写）
            % 存储数据为 data_asy_str (空格)
            obj.asy_adr = txt_adr;
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
            
            obj.data_asy = data;
        end
        
        function subssystem(obj)
            % 检索subsystem
            data = obj.data_asy;
            ans_a = strncmp('[subsystem]',data,11);
            ans_a = find(ans_a==1);
            data_a = cell(length(ans_a),1);
            for n = 1:length(ans_a)
                if n==length(ans_a)
                    data_a(n) = {data(ans_a(n):end)};
                else
                    data_a(n) = {data(ans_a(n):ans_a(n+1)-1)};
                end
            end
            for n = 1:length(data_a)
                subsdata_a(n,1).majorrole = data_a{n}{3}(12:end);% majorrole
                subsdata_a(n,1).minorrole = data_a{n}{4}(12:end);% minorrole
                subsdata_a(n,1).template = data_a{n}{5}(11:end);% template
                subsdata_a(n,1).usage = data_a{n}{6}(8:end-1);% usage
            end
            obj.subsdata = subsdata_a;
        end
        
        function asyname(obj)
            % 检索名称 & cbd路径 & cbdname
            [pathstr,asyname,ext] = fileparts(obj.asy_adr) ;
            [pathstr,ans_a,ext] = fileparts(pathstr) ;
            [pathstr,cbdname,ext] = fileparts(pathstr) ;
            
            obj.asy_name = asyname;
            obj.cbd_path = pathstr;
            obj.cbd_name = cbdname;
        end
        
        function assembly_class(obj)
            % 检索 assembly_class
            % 检索 装配系统类型 full_vehicle / suspension
            data = obj.data_asy;
            data_a = data{strncmp('assembly_class',data,14)};
            asy_class_a = data_a(17:end-1);
            obj.asy_class = asy_class_a;
        end
        
        function asytestrig(obj)
            % 检索 试验台类型
            data = obj.data_asy;
            ans_a = find(strncmp('[testrig]',data,9));
            data_a = data{ans_a+1}(8:end-1);
            obj.testrig = data_a;
        end
        
    end
    
    methods % 判断
        function out1 = is_asysus(obj)
            % 检测是否是 ‘suspension’悬架装配系统
            % 返回 0 或 1
            out1 = strcmpi(obj.asy_class,'suspension');
        end
        
        function out1 = is_asyfull(obj)
            % 检测是否是 ‘full_vehicle’整车装配系统
            % 返回 0 或 1
            out1 = strcmpi(obj.asy_class,'full_vehicle');
        end
        
        function out1 = is_cbdsame(obj)
            % 检测各个子系统 cbd 位置是否一致
            data = obj.subsdata;
            data_a = cell(length(data),1);
            for n = 1:length(data)
                %  USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_front_susp.sub'
                ans_a = strfind(data(n).usage,'>');
                if isempty(ans_a)
                    %  USAGE  =  'mdids://acar_shared1/subsystems.tbl/TR_Rear_Suspension.sub'
                    [a,cbd_a,c]=fileparts(fileparts(fileparts(data(n).usage)));
                    data_a(n) = {cbd_a};
                else
                    data_a(n) = {data(n).usage(2:ans_a-1)};
                end
                
            end
            % 和的平均值为 1 ，则认为各个子系统cbd文件夹一致
            ans_b = strcmpi(data_a,data_a{1});
            ans_c = mean(ans_b);
            ans_d = find(ans_b==0);
            if ans_c==1
                out1 = 1;
            else
                out1 = 0;
                % command 显示设置
                disp('将以下子系统所在位置cbd文件夹设置为默认：')
                disp([data(1).usage]);
                disp('以下为不一致项：');
                for n = 1:length(ans_d)
                    disp([data(ans_d(n)).usage]);
                end
                disp('其余子系统均一致');
            end
        end
        
        function out1 = is_asyfront(obj)
            % 检测 子系统是否为‘front’
            data = obj.subsdata;
            logical_a = false(length(data),1);
            for n = 1:length(data)
                logical_a(n) = strcmpi('front',data(n).minorrole);
            end
            if mean(logical_a)==1
                out1 = 1;
            else
                out1 = 0;
                % command 显示设置
                disp('以下为非‘front’项：')
                for n = 1:length(logical_a)
                    if logical_a(n)==0
                        disp([data(n).usage,'  次特性： ',data(n).minorrole]);
                    end
                end
            end
        end
        
    end
    
    
    
end

