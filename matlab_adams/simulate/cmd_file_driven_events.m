function cmd_file_driven_events(cmd_id,asy_name,rdf_addrA,xml_addrA)
% cmd_id:fopen��cmd�ļ�
% asy_name:װ���ļ�����
% rdf_addrA��·��rdf�ļ�
% xml_addA������ʱ��xml�ļ�
% mdids://acar_shared/roads.tbl/2d_flat.rdf
% mdids://FSAE_2012/driver_controls.tbl/new_steer.xml
fprintf(cmd_id,'acar analysis full_vehicle sdi submit &\n');
fprintf(cmd_id,'assembly=.%s &\n',asy_name);
fprintf(cmd_id,'output_prefix="" &\n');
fprintf(cmd_id,'comment="" &\n');
fprintf(cmd_id,'analysis_mode=interactive &\n');
fprintf(cmd_id,'road_data_file="%s" &\n',rdf_addrA);
fprintf(cmd_id,'dcf_file="%s" &\n',xml_addrA);
fprintf(cmd_id,'log_file=yes \n\n');
end