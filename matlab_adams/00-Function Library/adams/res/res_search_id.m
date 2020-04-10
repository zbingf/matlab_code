function id_n=res_search_id(name_1,name_2,data_str)
% name_1='steering_assist';%Entity name
% name_2='pinion_torque_front';%Component name
name_data=['<Entity name="',name_1,'"'];
name_data2=['<Component name="',name_2,'"'];
a=strncmp(name_data,data_str,length(name_data));
b=strncmp('</Entity>',data_str,3);
a1=find(a==1);
b1=find(b==1);
b2=find(b1>a1);
b3=b1(b2(1));
c=strncmp(name_data2,data_str(a1:b3),length(name_data2));
c1=find(c==1);
d=cell2mat(data_str(a1+c1-1));
id_n=str2double(d(strfind(d,'id=')+4:strfind(d,'" />')-1));

end