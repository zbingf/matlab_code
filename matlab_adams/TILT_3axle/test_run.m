clear,clc
sub_addr='G:\05_For_adams\fsae_2012.cdb\subsystems.tbl\fsae_front_susp.sub';
spring_name_fun=sub_search(sub_addr);
for n=1:length(spring_name_fun)
    eval(cell2mat(spring_name_fun(n)))
end