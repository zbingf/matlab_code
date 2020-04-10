function cmd_parallel_wheel_travel(cmd_id,output_name,asy_name,bump,rebound,step)
% 悬架台架平行轮跳仿真
% cmd_id:cmd文件 fopen
% output_name:仿真名称 实际后处理文件名+'_parallel_travel.res'
% asy_name:子系统名称
% bump:上跳行程mm
% rebound:下跳行程mm
% step:仿真步长
fprintf(cmd_id,'acar analysis suspension parallel_travel submit &\r\n');
fprintf(cmd_id,'assembly=.%s &\r\n',asy_name);
fprintf(cmd_id,'output_prefix="%s" &\r\n',output_name);
fprintf(cmd_id,'nsteps=%d &\r\n',step);
fprintf(cmd_id,'bump_disp=%f &\r\n',bump);
fprintf(cmd_id,'rebound_disp=%f &\r\n',rebound);
fprintf(cmd_id,'&\r\n');
fprintf(cmd_id,'steering_input=angle &\r\n');
fprintf(cmd_id,'vertical_setup=wheel_center_height &\r\n');
fprintf(cmd_id,'vertical_input=wheel_center_height &\r\n');
fprintf(cmd_id,'vertical_type=absolute &\r\n');
fprintf(cmd_id,'comment="" &\r\n');
fprintf(cmd_id,'analysis_mode=interactive &\r\n');
fprintf(cmd_id,'log_file=yes \r\n\r\n');
end