function data=res_import_nospace(res_adr)
% ����res�ļ�
% ����res�ļ���ַ
% ��ȡres���ݣ�ֻ��ȡ��ͷ�ַ����ڼ�������λ
% ���Ԫ�����ݣ��޿ո��޿��С�Сд
% ����ʱ�䣺2018/01/27

% ֻ��ȡ�ļ� 
res_id=fopen(res_adr,'r');

data=cell(1);n1=1;
while ~feof(res_id)
    % ��ȡһ��
    tline=fgetl(res_id);
    % ȥ�ո�
    a=find(isspace(tline));
    tline(a)=[];
    % ȥ����
    if ~length(tline)==0
        % Сдת��
        tline=lower(tline);
        % �ж�����
        if strncmp('<steptype="input">',tline,7)
            break
        end
        % ת��ΪԪ��
        data(n1)={tline};
        n1=n1+1;
    end
    
end
% ���� ��תΪ��
data=data';
% �ر�
fclose(res_id);

end
