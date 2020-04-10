function cmd_simulation_brake_test(cmd_id,asy_name,file_name,end_time,steps_length,rdf_addrA,v_initial,t_start,gear_position,final_brake,step_duration)
% �������棺�ƶ����� 
% cmd_id:fopen��cmd�ļ�
% asy_name:����װ��asy�ļ���
% file_name:����ļ���
% end_time:�������ʱ��
% steps_length:�����ܲ���
% rdf_addrA:·���ļ�rdf
% v_initial:��ʼ�ٶ�
% t_start:�ƶ���ʼʱ��
% gear_position:��λ
% final_brake:����ƶ���С��0~100��
% step_duration:�ƶ�0��final_brake��ʱ��
% mdids://acar_shared/roads.tbl/2d_flat.rdf
fprintf(cmd_id,'acar analysis full_vehicle brake_test submit &\n');
fprintf(cmd_id,'assembly=.%s &\n',asy_name);
fprintf(cmd_id,' output_prefix=%s &\n',file_name);
fprintf(cmd_id,' end_time=%s &\n',end_time);
fprintf(cmd_id,' number_of_steps=%s &\n',steps_length);
fprintf(cmd_id,' analysis_mode=interactive &\n');
fprintf(cmd_id,' road_data_file="%s" &\n',rdf_addrA);
fprintf(cmd_id,' steering_input=locked &\n');
fprintf(cmd_id,' initial_velocity=%s &\n',v_initial);
fprintf(cmd_id,' velocity_units=km_hr &\n');
fprintf(cmd_id,' start_value=%s &\n',t_start);
fprintf(cmd_id,' gear_position=%s &\n',gear_position);
fprintf(cmd_id,' qstatic_prephase=yes &\n');
fprintf(cmd_id,' log_file=yes &\n');
fprintf(cmd_id,' final_brake=%s &\n',final_brake);
fprintf(cmd_id,' step_duration=%s\n\n',step_duration);

end
