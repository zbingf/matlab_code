function cmd_open_template(cmd_id,cbd_name,tpl_name)
% 打开 模板文件
% cmd_id:cmd文件fopen
% cbd_name:cbd名称 FSAE_2012
% tpl_name:模板名称 _fsae_frontsusp
fprintf(cmd_id,'acar files template open &\r\n');
fprintf(cmd_id,'template_name="mdids://%s/templates.tbl/%s.tpl" \r\n\r\n',cbd_name,tpl_name);
end