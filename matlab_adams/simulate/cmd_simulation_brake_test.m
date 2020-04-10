function cmd_simulation_brake_test(cmd_id,asy_name,file_name,end_time,steps_length,rdf_addrA,v_initial,t_start,gear_position,final_brake,step_duration)
% 整车仿真：制动仿真 
% cmd_id:fopen打开cmd文件
% asy_name:整车装配asy文件名
% file_name:输出文件名
% end_time:仿真结束时间
% steps_length:仿真总步长
% rdf_addrA:路面文件rdf
% v_initial:初始速度
% t_start:制动开始时间
% gear_position:档位
% final_brake:最后制动大小（0~100）
% step_duration:制动0到final_brake的时间
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
