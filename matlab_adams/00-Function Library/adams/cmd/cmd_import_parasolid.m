function cmd_import_parasolid(cmd_id,file_addr,tpl_name,part_name) 
% ��ģ���ļ� tpl ������
% ����parasolid�ļ���part��
% cmd_id:cmd�ļ�fopen
% file_addr:parasolid�ļ���ַ-G:/05_For_adams/st_201603017.x_t
% tpl_name:ģ���ļ��� _fsae_frontsusp
% part_name:�������� ger_lower_control_arm
fprintf(cmd_id,'file parasolid read &\r\n');
fprintf(cmd_id,'file_name = "file://%s"  &\r\n',file_addr);
fprintf(cmd_id,'type = ASCII  &\r\n');
fprintf(cmd_id,'&\r\n');
fprintf(cmd_id,'part_name = .%s.%s &\r\n',tpl_name,part_name);
fprintf(cmd_id,'&\r\n');
fprintf(cmd_id,'orientation = 0.0, 0.0, 0.0 &\r\n');
fprintf(cmd_id,'&\r\n');
fprintf(cmd_id,'explode_assemblies = no\r\n\r\n');
end