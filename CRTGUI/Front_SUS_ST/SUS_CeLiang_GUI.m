global N
%>>>>>>>>>���������>>>>>>>>>>>>>>>>>>>
K_3=(Z2-Z3)./(Y2-Y3);
angle_1=atand(K_3)+90;
%>>>>>>>>>>>RSW>>>>Motion Ratio>>>>>>>
length_F=((y5-y6).^2+(z5-z6).^2+(x5-x6).^2).^0.5;
deta_s=diff(length_F); %������λ���ٶ�
deta_lt=diff(Z9);    %��̥�ӵ����Ĵ�ֱ���������ٶ�
MR_F=abs(deta_s./deta_lt);%Motion Ratio 
%>>>>>>>>>>>Z-Bar>>>>>>>>>>>>>>>>>>>>>>>>>0523
deta_t9=diff(t9);
MR_BF=abs(deta_t9./deta_lt);% deg/mm

%>>>>>>>>>>����>>>wheel travel>����>>>>>>>>>>>>>>>>>>>>>>>>>>
WT_F=Z9-str2double(get(handles.Z9,'string'));
%>>>>>>>>>>ת��>>>>>>>>>>>>>>>>>
for nn=1:1:1
deltx=(X14-X15);
delty=(Y14-Y15);
deltz=(Z14-Z15);
delt_x=(X_14-X_15);
delt_y=(Y_14-Y_15);
delt_z=(Z_14-Z_15);
ST_R=acosd(-delty./(deltx.^2+delty.^2).^0.5);
ST_L=acosd(-delt_y./(delt_x.^2+delt_y.^2).^0.5);
for n=1:1:size(ST_R)
    if ST_R(n)<0
        ST_R(n)=ST_R(n)+90;
    else
        ST_R(n)=ST_R(n)-90;
    end
    if ST_L(n)<0
        ST_L(n)=ST_L(n)+90;
    else
        ST_L(n)=ST_L(n)-90;
    end
end
end
%>>>>>>>>>>>��ά����ת��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% o=0:max(ST_L)/size(WT_F,1):max(ST_L); %����ת��
% S=((LL2)^2-(H-(LL1)*sind(r-o)).^2).^0.5+(LL1)*cosd(r-o)-(K-M)/2;
% ii=acosd((((K-M)/2-S).^2+H^2-(LL2)^2+(LL1)^2)./(2*(LL1)*((H^2+((K-M)/2-S).^2).^0.5)))+acotd((K-M-2*S)/(2*H))-r;
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

I=acotd(cotd(ST_L)-K/L);%���۰�����
pak=(ST_R-ST_L)./(I-ST_L)*100;%��ά�ٷֱȰ�����/%

%>>>>>>�־�仯>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
LJ=Y9-str2double(get(handles.Y9,'string'));

%>>>>>>>>>>>>>>>>>���������>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
camber_1=-atand((Z16-Z9)./(Y16-Y9));

%>>>>>>>>>>>>>>>>>>>>>>>>�������>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if get(handles.radiobutton6,'Value')
    dizhi1=uigetdir;%��������Ŀ¼
    daochu=[dizhi1,'\MR_F.mat'];save(daochu,'MR_F');%����MR
    daochu=[dizhi1,'\MR_BF.mat'];save(daochu,'MR_BF');%����MR_BF
    daochu=[dizhi1,'\WT_F.mat'];save(daochu,'WT_F');%������������ 
    daochu=[dizhi1,'\length_F.mat'];save(daochu,'length_F');%������������    
end
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
assignin('base','Z9',Z9);
assignin('base','T2',T2);
assignin('base','l2',l2);
assignin('base','t9',t9);
assignin('base','l7',l7);
assignin('base','MR_BF',MR_BF);
assignin('base','l8',l8);
assignin('base','t5',t5);
assignin('base','WT_F',WT_F);
assignin('base','ST_L',ST_L);
assignin('base','ST_R',ST_R);
assignin('base','Q_L',Q_L);
assignin('base','Q_R',Q_R);
assignin('base','I',I);
% assignin('base','length_F',length_F);
assignin('base','MR_F',MR_F);
%>>>>>>>>>>>>>>��ͼ>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
color=['b' 'g' 'r' 'c' 'm' 'y' 'k' 'w']; 
if  get(handles.radiobutton1,'Value')   %������
    figure(1)
    subplot(2,2,1);hold on;grid on
    plot(WT_F,length_F)%,color(N))
    xlabel('��̥����/mm')
    ylabel('�������᳤��/mm')
    
    subplot(2,2,2);hold on;grid on
    plot(WT_F(2:size(WT_F,1)),MR_F)%,color(N))
    xlabel('��̥����/mm')
    ylabel('Motion ratio')
    
    subplot(2,2,4);hold on;grid on
    plot(WT_F(2:size(WT_F,1)),MR_BF)%,color(N))
    xlabel('��̥����/mm')
    ylabel('Z-Bar Motion ratio deg/mm')
    
    subplot(2,2,3);hold on;grid on
    plot(WT_F,t9)%,color(N))
    xlabel('��̥����/mm')
    ylabel('Z-Bar /deg')
    
end
if  get(handles.radiobutton2,'Value')
    figure(1)
    subplot(121);hold on;grid on
    plot(ST_L(6:size(WT_F,1)),pak(6:size(WT_F,1)),color(N))
    xlabel('����ת��/deg')
    ylabel('�ٷֱȰ�����/%')
    subplot(122);hold on;grid on
    plot(ST_L,ST_R-ST_L,color(N))
    xlabel('����ת��/deg')
    ylabel('������ת�ǲ�/deg')
end
if get(handles.radiobutton8,'Value')
    figure(1)
    subplot(221);hold on;grid on
    plot(WT_F,angle_1,color(N))
    xlabel('��̥����/mm')
    ylabel('��������仯')  
    subplot(222);hold on;grid on
    plot(WT_F,LJ,color(N))
    xlabel('��̥����/mm')
    ylabel('�־�仯/mm')
    subplot(223);hold on;grid on
    plot(WT_F,ST_L,color(N))    
    xlabel('��̥����/mm')
    ylabel('������ǰ����/deg')  
    subplot(224);hold on;grid on
    plot(WT_F,camber_1,color(N))    
    xlabel('��̥����/mm')
    ylabel('���������/deg')  
end
end