global N
%>>>>>>>>>���������>>>>>>>>>>>>>>>>>>>
K_3=(Z2-Z3)./(Y2-Y3);
angle_1=atand(K_3)+90;
%>>>>>>>>>>>RSW>>>>Motion Ratio>>>>>>>
length_F=((y5-y6).^2+(z5-z6).^2+(x5-x6).^2).^0.5;
deta_s=diff(length_F); %������λ���ٶ�
deta_lt=diff(Z9);    %��̥�ӵ����Ĵ�ֱ���������ٶ�
MR_F=abs(deta_s./deta_lt);%Motion Ratio 
%>>>>>>>>>>����>>>wheel travel>����>>>>>>>>>>>>>>>>>>>>>>>>>>
WT_F=Z9-str2double(get(handles.Z9,'string'));
%>>>>>>>>>>ת��>>>>>>>>>>>>>>>>>
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
    daochu=[dizhi1,'\WT_F.mat'];save(daochu,'WT_F');%������������
    daochu=[dizhi1,'\length_F.mat'];save(daochu,'length_F');%������������    
end
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
assignin('base','Z9',Z9);
assignin('base','WT_F',WT_F);
assignin('base','ST_L',ST_L);
assignin('base','ST_R',ST_R);
assignin('base','Q_L',Q_L);
assignin('base','Q_R',Q_R);
assignin('base','I',I);
% assignin('base','length_F',length_F);
assignin('base','MR_F',MR_F);
%>>>>>>>>>>>>>>��ͼ>>>>>>>>>>>>>>>>>>>>>>
color=['b' 'g' 'r' 'c' 'm' 'y' 'k' 'w']; 
    hold(handles.axes1,'on');
    grid(handles.axes1,'on');    
    grid(handles.axes2,'on');
    hold(handles.axes2,'on');
    grid(handles.axes3,'on');
    hold(handles.axes3,'on');
    hold(handles.axes4,'on');
    grid(handles.axes4,'on');
if  (get(handles.radiobutton1,'Value')+get(handles.radiobutton2,'Value'))
    if  get(handles.radiobutton1,'Value')
        plot(handles.axes1,WT_F,length_F,color(N))
        xlabel(handles.axes1,'��̥����/mm')
        ylabel(handles.axes1,'�������᳤��/mm')

        plot(handles.axes2,WT_F(2:size(WT_F,1)),MR_F,color(N))
        xlabel(handles.axes2','��̥����/mm')
        ylabel(handles.axes2','Motion ratio')
    else
        plot(handles.axes1,ST_L(6:size(WT_F,1)),pak(6:size(WT_F,1)),color(N))
        xlabel(handles.axes1,'����ת��/deg')
        ylabel(handles.axes1,'�ٷֱȰ�����/%')
    
        plot(handles.axes4,ST_L,ST_R-ST_L,color(N))
        xlabel(handles.axes4','����ת��/deg')
        ylabel(handles.axes4','������ת�ǲ�/deg')
    end
else
    plot(handles.axes1,WT_F,angle_1,color(N))
    xlabel(handles.axes1,'��̥����/mm')
    ylabel(handles.axes1,'��������仯')
    
    plot(handles.axes2,WT_F,LJ,color(N))
    xlabel(handles.axes2','��̥����/mm')
    ylabel(handles.axes2','�־�仯/mm')
    
    plot(handles.axes3,WT_F,ST_L,color(N))    
    xlabel(handles.axes3','��̥����/mm')
    ylabel(handles.axes3','������ǰ����/deg')  
    
    plot(handles.axes4,WT_F,camber_1,color(N))    
    xlabel(handles.axes4','��̥����/mm')
    ylabel(handles.axes4','���������/deg')  
    
end