global N

%>>>>>>>>>���������>>>>>>>>>>>>>>>>>>>
K_3=(Z2-Z3)./(Y2-Y3);
angle_1=atand(K_3)+90;
%>>>>>>>>>>>RSW>>>>Motion Ratio ����>>>>>>>
length_R=((y5-y6).^2+(z5-z6).^2).^0.5;
deta_s=diff(length_R); %������λ���ٶ�
deta_lt=diff(Z9);    %��̥�ӵ����Ĵ�ֱ���������ٶ�
MR_R=abs(deta_s./deta_lt);%Motion Ratio 
%>>>>>>>>>>>>U-Bar MR>>>>>>>>>>>>>>>>>>>>>>
t9R=t9;
deta_t9R=diff(t9);
MR_BR=abs(deta_t9R./deta_lt);
%>>>>>>>>>>����>>>wheel travel>����>>>>>>>>>>>>>>>>>>>>>>>>>>
WT_R=Z9-str2double(get(handles.Z9,'string'));
%>>>>>>>>>>ʵ��ת���>>>>>>>>>>>>>>>>>>>>>>>>>>>>
deltx=(X14-X15);
delty=(Y14-Y15);
deltz=(Z14-Z15);
ST_R=acosd(-delty./(deltx.^2+delty.^2).^0.5);
for n=1:1:size(ST_R)
    if ST_R(n)<0
        ST_R(n)=ST_R(n)+90;
    else
        ST_R(n)=ST_R(n)-90;
    end
end
%>>>>>>�־�仯>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    LJ=Y9-str2double(get(handles.Y9,'string'));
%>>>>>>>>>>>>>>>>>���������>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
camber_1=-atand((Z16-Z9)./(Y16-Y9));
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if get(handles.radiobutton5,'Value')    
    dizhi1=uigetdir;%��������Ŀ¼
    daochu=[dizhi1,'\MR_R.mat'];save(daochu,'MR_R');%����MR
    daochu=[dizhi1,'\WT_R.mat'];save(daochu,'WT_R');%������������
    daochu=[dizhi1,'\length_R.mat'];save(daochu,'length_R');%������������
    daochu=[dizhi1,'\MR_BR.mat'];save(daochu,'MR_BR');%����U-Bar ��MR����
    daochu=[dizhi1,'\t9R.mat'];save(daochu,'t9R');%������������
end
%�����������������������ԡ�����������������������������������
assignin('base','length_R',length_R);
assignin('base','WT_R',WT_R);
assignin('base','camber_1',camber_1);
assignin('base','y5',y5);
assignin('base','z5',z5);
assignin('base','LJ',LJ);
assignin('base','angle_1',angle_1);
assignin('base','MR_BR',MR_BR);
%��������������������������������������������������������
%>>>>>>>>>>>>>>��ͼ>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
color=['b' 'g' 'r' 'c' 'm' 'y' 'k' 'w']; 
if get(handles.radiobutton1,'Value')
figure(2)
subplot(221);
hold on;grid on;
plot(WT_R,length_R,color(N))
xlabel('��̥����/mm')
ylabel('�������᳤��/mm')
subplot(222)  
hold on;grid on;
plot(WT_R(2:size(WT_R,1)),MR_R,color(N))
xlabel('��̥����/mm')
ylabel('Motion ratio')
subplot(223)      
hold on;grid on;
plot(WT_R(2:size(WT_R,1)),MR_BR,color(N))
xlabel('��̥����/mm')
ylabel('U-Bar-Motion ratio (deg/mm)')
subplot(224)  
hold on;grid on;
plot(WT_R(2:size(WT_R,1)),-t9(2:size(WT_R,1)),color(N))
xlabel('��̥����/mm')
ylabel('U-Bar-ת��(deg)')
end
if get(handles.radiobutton6,'Value')
figure(2)
subplot(221)
hold on;grid on;
plot(WT_R,angle_1,color(N))
xlabel('��̥����/mm')
ylabel('��������仯')
subplot(222) 
hold on;grid on;
plot(WT_R,LJ,color(N))
xlabel('��̥����/mm')
ylabel('��̥�ӵ����Ĳ���仯/mm')
subplot(223)  
hold on;grid on;
plot(WT_R,ST_R,color(N))    
xlabel('��̥����/mm')
ylabel('������ǰ����/deg')  
subplot(224)  
hold on;grid on;
plot(WT_R,camber_1,color(N))    
xlabel('��̥����/mm')
ylabel('���������/deg')  
end
end