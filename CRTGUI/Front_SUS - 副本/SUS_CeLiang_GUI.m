global N
%>>>>>>>>>主销内倾角>>>>>>>>>>>>>>>>>>>
K_3=(Z2-Z3)./(Y2-Y3);
angle_1=atand(K_3)+90;
%>>>>>>>>>>>RSW>>>>Motion Ratio>>>>>>>
length_F=((y5-y6).^2+(z5-z6).^2+(x5-x6).^2).^0.5;
deta_s=diff(length_F); %减震器位移速度
deta_lt=diff(Z9);    %轮胎接地中心垂直方向跳动速度
MR_F=abs(deta_s./deta_lt);%Motion Ratio 
%>>>>>>>>>>轮跳>>>wheel travel>左轮>>>>>>>>>>>>>>>>>>>>>>>>>>
WT_F=Z9-str2double(get(handles.Z9,'string'));
%>>>>>>>>>>转角>>>>>>>>>>>>>>>>>
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
%>>>>>>>>>>>二维理论转向>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% o=0:max(ST_L)/size(WT_F,1):max(ST_L); %外轮转角
% S=((LL2)^2-(H-(LL1)*sind(r-o)).^2).^0.5+(LL1)*cosd(r-o)-(K-M)/2;
% ii=acosd((((K-M)/2-S).^2+H^2-(LL2)^2+(LL1)^2)./(2*(LL1)*((H^2+((K-M)/2-S).^2).^0.5)))+acotd((K-M-2*S)/(2*H))-r;
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

I=acotd(cotd(ST_L)-K/L);%理论阿克曼
pak=(ST_R-ST_L)./(I-ST_L)*100;%三维百分比阿克曼/%

%>>>>>>轮距变化>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
LJ=Y9-str2double(get(handles.Y9,'string'));

%>>>>>>>>>>>>>>>>>车轮外倾角>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
camber_1=-atand((Z16-Z9)./(Y16-Y9));

%>>>>>>>>>>>>>>>>>>>>>>>>数据输出>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if get(handles.radiobutton6,'Value')
    dizhi1=uigetdir;%导出数据目录
    daochu=[dizhi1,'\MR_F.mat'];save(daochu,'MR_F');%导出MR
    daochu=[dizhi1,'\WT_F.mat'];save(daochu,'WT_F');%导出轮跳数据
    daochu=[dizhi1,'\length_F.mat'];save(daochu,'length_F');%导出轮跳数据    
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
%>>>>>>>>>>>>>>作图>>>>>>>>>>>>>>>>>>>>>>
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
        xlabel(handles.axes1,'轮胎跳动/mm')
        ylabel(handles.axes1,'弹簧阻尼长度/mm')

        plot(handles.axes2,WT_F(2:size(WT_F,1)),MR_F,color(N))
        xlabel(handles.axes2','轮胎跳动/mm')
        ylabel(handles.axes2','Motion ratio')
    else
        plot(handles.axes1,ST_L(6:size(WT_F,1)),pak(6:size(WT_F,1)),color(N))
        xlabel(handles.axes1,'外轮转角/deg')
        ylabel(handles.axes1,'百分比阿克曼/%')
    
        plot(handles.axes4,ST_L,ST_R-ST_L,color(N))
        xlabel(handles.axes4','外轮转角/deg')
        ylabel(handles.axes4','内外轮转角差/deg')
    end
else
    plot(handles.axes1,WT_F,angle_1,color(N))
    xlabel(handles.axes1,'轮胎跳动/mm')
    ylabel(handles.axes1,'主销内倾变化')
    
    plot(handles.axes2,WT_F,LJ,color(N))
    xlabel(handles.axes2','轮胎跳动/mm')
    ylabel(handles.axes2','轮距变化/mm')
    
    plot(handles.axes3,WT_F,ST_L,color(N))    
    xlabel(handles.axes3','轮胎跳动/mm')
    ylabel(handles.axes3','左轮轮前束角/deg')  
    
    plot(handles.axes4,WT_F,camber_1,color(N))    
    xlabel(handles.axes4','轮胎跳动/mm')
    ylabel(handles.axes4','车轮外倾角/deg')  
    
end