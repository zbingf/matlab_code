function cmd_spring_preload(cmd_id,assembly_name,subsystem_name,spring_name,spring_addr,preload_value,symmetric)
    % 弹簧预载设置
    % cmd_id:cmd文件open
    % assembly_name:整车装配-名称
    % subsystem_name
    % spring_name:弹簧-名称
    % spring_addr:弹簧地址
    % preload_value:弹簧预载值
    % symmetric:是否左右对称 'yes' or 'no'
    fprintf(cmd_id,'acar standard_interface spring &\r\n');
    fprintf(cmd_id,'spring=.%s.%s.%s &\r\n',assembly_name,subsystem_name,spring_name);
    fprintf(cmd_id,'property_file=''%s'' &\r\n',spring_addr);
    fprintf(cmd_id,'user_value=%f &\r\n',preload_value);
    fprintf(cmd_id,'value_type=preload &\r\n');
    fprintf(cmd_id,'symmetric=%s\r\n\r\n',symmetric);
end
    