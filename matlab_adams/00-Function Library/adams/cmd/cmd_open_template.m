function cmd_open_template(cmd_id,cbd_name,tpl_name)
% �� ģ���ļ�
% cmd_id:cmd�ļ�fopen
% cbd_name:cbd���� FSAE_2012
% tpl_name:ģ������ _fsae_frontsusp
fprintf(cmd_id,'acar files template open &\r\n');
fprintf(cmd_id,'template_name="mdids://%s/templates.tbl/%s.tpl" \r\n\r\n',cbd_name,tpl_name);
end