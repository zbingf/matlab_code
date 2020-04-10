function cmd_read_testdata(cmd_id,testdata_addr)
    % cmd命令
    % 读取text文件
    % cmd_id：cmd文件open
    % testdata_addr text文件地址x
    file_name=strrep(testdata_addr,'/','\');
    fprintf(cmd_id,'file testdata read measures &\r\n');
    fprintf(cmd_id,'use_file_column_labels = yes &\r\n');
    fprintf(cmd_id,'&\r\n');
    fprintf(cmd_id,'file_name = ''%s'' \r\n\r\n',file_name);
end
