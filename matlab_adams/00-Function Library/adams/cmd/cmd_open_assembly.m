function cmd_open_assembly(cmd_id,assembly_addr)
    % cmd������
    % ��װ���ļ� asy
    % assembly_addr��װ���ļ���ַ
    fprintf(cmd_id,'acar files assembly open &\r\n');
    fprintf(cmd_id,'assembly_name=''%s'' \r\n',assembly_addr);
end