function cmd_read_testdata(cmd_id,testdata_addr)
    % cmd����
    % ��ȡtext�ļ�
    % cmd_id��cmd�ļ�open
    % testdata_addr text�ļ���ַx
    file_name=strrep(testdata_addr,'/','\');
    fprintf(cmd_id,'file testdata read measures &\r\n');
    fprintf(cmd_id,'use_file_column_labels = yes &\r\n');
    fprintf(cmd_id,'&\r\n');
    fprintf(cmd_id,'file_name = ''%s'' \r\n\r\n',file_name);
end
