function cmd_spring_preload(cmd_id,assembly_name,subsystem_name,spring_name,spring_addr,preload_value,symmetric)
    % ����Ԥ������
    % cmd_id:cmd�ļ�open
    % assembly_name:����װ��-����
    % subsystem_name
    % spring_name:����-����
    % spring_addr:���ɵ�ַ
    % preload_value:����Ԥ��ֵ
    % symmetric:�Ƿ����ҶԳ� 'yes' or 'no'
    fprintf(cmd_id,'acar standard_interface spring &\r\n');
    fprintf(cmd_id,'spring=.%s.%s.%s &\r\n',assembly_name,subsystem_name,spring_name);
    fprintf(cmd_id,'property_file=''%s'' &\r\n',spring_addr);
    fprintf(cmd_id,'user_value=%f &\r\n',preload_value);
    fprintf(cmd_id,'value_type=preload &\r\n');
    fprintf(cmd_id,'symmetric=%s\r\n\r\n',symmetric);
end
    