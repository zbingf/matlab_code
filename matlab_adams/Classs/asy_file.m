classdef asy_file < handle
    % asy �ļ�����
    properties
        asy_adr % asy�ļ���ַ
        asy_name % asy �ļ�����
        asy_class % asy ����
        testrig % ����̨������
        cbd_name % �ļ�����cbd �ļ�������
        cbd_path % asy ����cbd ·��
        data_asy % asy �ļ����ݣ�Ԫ����
        subsdata % asy �ļ��� ������ϵͳ ���ͣ��ṹ�壩
    end
    
    methods
        function obj = asy_file(txt_adr)
            % ���캯��
            openfile(obj,txt_adr)
            subssystem(obj)
            asyname(obj)
            assembly_class(obj)
            asytestrig(obj)
        end
        
        function openfile(obj,txt_adr)
            % ���ļ����������ݣ�ȥ�ո� ���� Сд��
            % �洢����Ϊ data_asy_str (�ո�)
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
            data = lower(data); % Сд
            
            obj.data_asy = data;
        end
        
        function subssystem(obj)
            % ����subsystem
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
            % �������� & cbd·�� & cbdname
            [pathstr,asyname,ext] = fileparts(obj.asy_adr) ;
            [pathstr,ans_a,ext] = fileparts(pathstr) ;
            [pathstr,cbdname,ext] = fileparts(pathstr) ;
            
            obj.asy_name = asyname;
            obj.cbd_path = pathstr;
            obj.cbd_name = cbdname;
        end
        
        function assembly_class(obj)
            % ���� assembly_class
            % ���� װ��ϵͳ���� full_vehicle / suspension
            data = obj.data_asy;
            data_a = data{strncmp('assembly_class',data,14)};
            asy_class_a = data_a(17:end-1);
            obj.asy_class = asy_class_a;
        end
        
        function asytestrig(obj)
            % ���� ����̨����
            data = obj.data_asy;
            ans_a = find(strncmp('[testrig]',data,9));
            data_a = data{ans_a+1}(8:end-1);
            obj.testrig = data_a;
        end
        
    end
    
    methods % �ж�
        function out1 = is_asysus(obj)
            % ����Ƿ��� ��suspension������װ��ϵͳ
            % ���� 0 �� 1
            out1 = strcmpi(obj.asy_class,'suspension');
        end
        
        function out1 = is_asyfull(obj)
            % ����Ƿ��� ��full_vehicle������װ��ϵͳ
            % ���� 0 �� 1
            out1 = strcmpi(obj.asy_class,'full_vehicle');
        end
        
        function out1 = is_cbdsame(obj)
            % ��������ϵͳ cbd λ���Ƿ�һ��
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
            % �͵�ƽ��ֵΪ 1 ������Ϊ������ϵͳcbd�ļ���һ��
            ans_b = strcmpi(data_a,data_a{1});
            ans_c = mean(ans_b);
            ans_d = find(ans_b==0);
            if ans_c==1
                out1 = 1;
            else
                out1 = 0;
                % command ��ʾ����
                disp('��������ϵͳ����λ��cbd�ļ�������ΪĬ�ϣ�')
                disp([data(1).usage]);
                disp('����Ϊ��һ���');
                for n = 1:length(ans_d)
                    disp([data(ans_d(n)).usage]);
                end
                disp('������ϵͳ��һ��');
            end
        end
        
        function out1 = is_asyfront(obj)
            % ��� ��ϵͳ�Ƿ�Ϊ��front��
            data = obj.subsdata;
            logical_a = false(length(data),1);
            for n = 1:length(data)
                logical_a(n) = strcmpi('front',data(n).minorrole);
            end
            if mean(logical_a)==1
                out1 = 1;
            else
                out1 = 0;
                % command ��ʾ����
                disp('����Ϊ�ǡ�front���')
                for n = 1:length(logical_a)
                    if logical_a(n)==0
                        disp([data(n).usage,'  �����ԣ� ',data(n).minorrole]);
                    end
                end
            end
        end
        
    end
    
    
    
end

