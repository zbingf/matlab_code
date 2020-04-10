clear,clc
sub_addr='C:\Users\ABing\Documents\MATLAB\fsae_front_susp.sub';
data=sub_search_new3(sub_addr);
m_path=fileparts(which('for_sub_search_test.m'));
cd(m_path);
txt_addr=[m_path,'\message.txt'];
txt_id=fopen(txt_addr,'w');
fclose all;
diary(txt_addr)
if isfield(data.spring,'double')
    for n=1:length(data.spring.double)
        disp(data.spring.double(n))
    end
end
if isfield(data.spring,'single')
    for n=1:length(data.spring.single)
        disp(data.spring.single(n))
    end
end
if isfield(data.damper,'double')
    for n=1:length(data.damper.double)
        disp(data.damper.double(n))
    end
    if isfield(data.damper,'single')
        for n=1:length(data.damper.single)
            disp(data.damper.single(n))
        end
    end
    
end
diary off