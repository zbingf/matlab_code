function cmd_open_assembly(cmd_id,assembly_addr)
    % cmd命令流
    % 打开装配文件 asy
    % assembly_addr：装配文件地址
    fprintf(cmd_id,'acar files assembly open &\r\n');
    fprintf(cmd_id,'assembly_name=''%s'' \r\n',assembly_addr);
end