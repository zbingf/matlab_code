function cmd_adjust_mass(cmd_id,assembly_name,subsystem_name,frame_name,mark_name,mass_CG,Ixx,Iyy,Izz)
    % cmd命令流
    % 质量、转动惯量调整
    % cmd_id：cmd文件fopen
    % assembly_name:整车装配-名称
    % subsystem_name:子系统-名称
    % mark_name:总质心所在mark点（此处默认 mark点附属车身）
    % frame_name:mark点所属part
    % mass_CG：总质量 kg
    % Ixx,Iyy,Izz ：绕质心转动惯量 kg*mm
    fprintf(cmd_id,'acar toolkit adjust mass &\r\n');
    fprintf(cmd_id,'model=.%s &\r\n',assembly_name);
    fprintf(cmd_id,'desired_model_mass=%s &\r\n',mass_CG);
    fprintf(cmd_id,'cg_location=0,0,0 &\r\n');
    fprintf(cmd_id,'ixx=%s &\r\n',Ixx);
    fprintf(cmd_id,'iyy=%s &\r\n',Iyy);
    fprintf(cmd_id,'izz=%s &\r\n',Izz);
    fprintf(cmd_id,'&\r\n');
    fprintf(cmd_id,'&\r\n');
    fprintf(cmd_id,'&\r\n');
    fprintf(cmd_id,'relative_to=.%s.%s.%s.%',assembly_name,subsystem_name,frame_name,mark_name);
    fprintf(cmd_id,'m_part=.%s.%s.%s \r\n\r\n',assembly_name,subsystem_name,frame_name);
end
    
    