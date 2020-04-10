function cmd_adjust_mass(cmd_id,assembly_name,subsystem_name,frame_name,mark_name,mass_CG,Ixx,Iyy,Izz)
    % cmd������
    % ������ת����������
    % cmd_id��cmd�ļ�fopen
    % assembly_name:����װ��-����
    % subsystem_name:��ϵͳ-����
    % mark_name:����������mark�㣨�˴�Ĭ�� mark�㸽������
    % frame_name:mark������part
    % mass_CG�������� kg
    % Ixx,Iyy,Izz ��������ת������ kg*mm
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
    
    