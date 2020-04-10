T=10;%仿真时间
%>>>>>>>>>>>>>以前轴中心点为原点坐标----ISO_左悬架>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%>>>>>>>>>>>仿真>>>>>>>>>>>>>>>>>>>>
LT=str2double(get(handles.LT,'string'));%当LT=1时，有平行轮跳
%>>>>前束，外倾角>>>>>>>>>>>>>>>>>>>>
toe=str2double(get(handles.toe,'string'));
camber=str2double(get(handles.camber,'string'));
IN=str2double(get(handles.IN,'string'));%Inclination angle 主销内倾角
CA=str2double(get(handles.CA,'string'));%Caster angle 主销后倾
L=str2double(get(handles.L,'string'));%轴距
%以前轴中心为原点，坐标
X9=str2double(get(handles.X9,'string'));
Y9=str2double(get(handles.Y9,'string'));
Z9=str2double(get(handles.Z9,'string'));%轮胎接地中心点
x6=str2double(get(handles.x6,'string'));
y6=str2double(get(handles.y6,'string'));
z6=str2double(get(handles.z6,'string'));%阻尼车架接点
%>>>>>>>>>>悬架 rear view>>>>>>>>>>>>>>
for nn=1:1:1
%>>>>>>>>>>>>悬架正视几何，四连杆>>>>>>>>>>>>>>>>>>>>>
H=str2double(get(handles.H,'string'));%侧倾中心高
SR=str2double(get(handles.SR,'string'));%scrub radius
Z3=str2double(get(handles.Z3,'string'));%上横臂outer点Z坐标
T4=str2double(get(handles.T4,'string'));%上横臂角度
Z2=str2double(get(handles.Z2,'string'));%下横臂outer点Z坐标
Y1=str2double(get(handles.Y1,'string'));%下横臂inner点Y坐标
Y4=str2double(get(handles.Y4,'string'));%上横臂inner点Y坐标
T3=IN+90; %主销与Y轴夹角
K9_10=-H/Y9;%轮胎接地中点与侧倾中心连线斜率
K2_3=tand(T3);%主销轴线斜率
K3_4=tand(T4);%上横臂斜率
B9_10=(Z9+H);
B2_3=-K2_3*(Y9-SR)+Z9;
Y3=(Z3-Z9)/K2_3+Y9-SR;
B3_4=Z3-Y3*tand(T4);
Y10=(B3_4-B9_10)/(K9_10-K3_4);
Z10=K9_10*Y10+B9_10;
Y2=(Z2-Z9)/K2_3+Y9-SR;
K1_2=(Z2-Z10)/(Y2-Y10);
Z1=K1_2*(Y1-Y2)+Z2;
Z4=tand(T4)*(Y4-Y3)+Z3;
T2=atand((Z2-Z1)/(Y2-Y1));
end
%>>>>>>>>>>>>悬架侧视几何>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
T5=str2double(get(handles.T5,'string'));%上横臂旋转轴线 顺时针为正
T6=str2double(get(handles.T6,'string'));%下横臂旋转轴线
a1=str2double(get(handles.a1,'string'));% 上横臂过outer点，与轴线交于一点，该点到 inner前点距离
b1=str2double(get(handles.b1,'string'));% 到inner后点距离
a2=str2double(get(handles.a2,'string'));% 下横臂
b2=str2double(get(handles.b2,'string'));

X4=L;X1=L;%inner点
X2=L-abs(Z3)*tand(CA);
X3=L+abs(Z2)*tand(CA);
X5=X4-a1*cosd(T5);Y5=Y4;Z5=Z4-a1*sind(T5);%上横臂 inner 前点 上inner点 X4 Y4 Z4
X6=X4+b1*cosd(T5);Y6=Y4;Z6=Z4+b1*sind(T5);%上横臂 inner 后点
X7=X1-a2*cosd(T6);Y7=Y1;Z7=Z1-a2*sind(T6);%下横臂 inner 前点  下inner点 X1 Y1 Z1
X8=X1+b2*cosd(T6);Y8=Y1;Z8=Z1+b2*sind(T6);%下横臂 inner 后点
end
%>>>>>>>>>>摇臂推杆,U-bar>>>>>>>>>>>>>> 坐标命名逆时针
for nn=1:1:1
    nnn=get(handles.popupmenu1,'Value');
    switch nnn 
    case 1
        for nn=1:1:1  %>>>>>>>摇臂推杆,四连杆>>>>>>>>>>
        x4=str2double(get(handles.x4,'string')); %摇臂车架接点
        y4=str2double(get(handles.y4,'string')); 
        z4=str2double(get(handles.z4,'string')); 

        l2=str2double(get(handles.l2,'string'));   %下横臂inner点到下横臂推杆接点 
        l4=str2double(get(handles.l4,'string'));   %摇臂-推杆边
        l5=str2double(get(handles.l5,'string'));   %摇臂-阻尼边

        t2=str2double(get(handles.t2,'string'));
        t4=str2double(get(handles.t4,'string')); %摇臂-推杆边与Y轴夹角
        t5=str2double(get(handles.t5,'string'));  %摇臂减震器边-摇臂推杆边 间的夹角
        t5=t5+t4;%将摇臂夹角转化为，摇臂-阻尼线与水平面夹角
        x2=x4;y2=Y1+l2*cosd(t2+T2);z2=Z1+l2*sind(t2+T2);%推杆下横臂接点  %绝对坐标
        x3=0;y3=l4*cosd(t4);z3=l4*sind(t4);%推杆摇臂接点 %相对 44 坐标
        x5=0;y5=l5*cosd(t5);z5=l5*sind(t5);%摇臂阻尼接点 %相对 44 坐标
        Rtz=0;
        Rty=0;
        end
        for nn=1:1:1 %>>>>>>>>U-Bar>>>>>
        t7=str2double(get(handles.t7,'string'));%摇臂-Ubar边 与Y轴夹角
        l7=str2double(get(handles.l7,'string'));%摇臂-Ubar边长
        x9=str2double(get(handles.x9,'string')); %绝对坐标
        z9=str2double(get(handles.z9,'string')); %绝对坐标
        l9=str2double(get(handles.l9,'string')); %杠杆臂,往车后布置
        l8=str2double(get(handles.l8,'string'));        
        x7=0;y7=l7*cosd(t7);z7=l7*sind(t7);%相对 44 坐标
        y9=y7+y4;%绝对坐标
        y8=y9;
        syms x8 z8
        [x8,z8]=solve((x8-x7-x4)^2+(z8-z7-z4)^2-l8^2,(x8-x9)^2+(z8-z9)^2-l9^2); %两圆交点的解析解
        x8=double(vpa(x8,5));
        z8=double(vpa(z8,5));
        if x9>(x7+x4)  %x7为相对坐标
            for n=1:1:2
                if min(x8)==x8(n)
                x8=x8(n);
                z8=z8(n);
                break
                end
            end
        else
            for n=1:1:2
                if max(x8)==x8(n)
                x8=x8(n);
                z8=z8(n);
                break
                end
            end
        end
        
        end
     end
end
%>>>>>>>>>>>>>控制臂-上置>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
o_x=str2double(get(handles.o_x,'string'));%横拉杆outer点相对 上横臂outer点位置，X轴方向为正（及朝车后）
i_x=str2double(get(handles.i_x,'string'));%横拉杆inner点相对 上横臂inner后点位置，X轴方向为正（及朝车后）
Z11=Z6;
Y11=Y6;
Z12=Z3;
Y12=Y3;
X11=i_x+X6;%由相对位置转化为坐标
X12=o_x+X3;
end
%>>>>>>>>>>>>>>>>>先车轮外倾，后前束，测量>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
%注：考虑前束时，不管大小只管方向，俯视解
L16=100;
X16_1=0;Y16_1=-L16*cosd(camber);Z16_1=L16*sind(camber); %外倾角 法向量
X16_2=abs(Y16_1)*sind(toe);Y16_2=Y16_1*cosd(toe);Z16_2=Z16_1;%前束（无关大小只管方向，俯视）
X16=X9+X16_2;Y16=Y9+Y16_2;Z16=Z9+Z16_2;
L14=abs(Z9);
X14_1=-L14*cosd(toe);Y14_1=-L14*sind(toe);Z14_1=0;%前束
X14=X9+X14_1;Y14=Y9+Y14_1;    Z14=Z9+Z14_1;

L15=abs(Z9);
X15_1=L15*cosd(toe);Y15_1=L15*sind(toe);Z15_1=0;%前束
X15=X9+X15_1;Y15=Y9+Y15_1;     Z15=Z9+Z15_1;

end
%>>>>>>>>>>>>>>>>>>>>>>>输出到base Simulink用>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
assignin('base','T',T);assignin('base','LT',LT);
assignin('base','IN',IN);assignin('base','CA',CA);assignin('base','SR',SR);

assignin('base','X2',X2);assignin('base','Y2',Y2);assignin('base','Z2',Z2);
assignin('base','X3',X3);assignin('base','Y3',Y3);assignin('base','Z3',Z3);
assignin('base','X5',X5);assignin('base','Y5',Y5);assignin('base','Z5',Z5);
assignin('base','X6',X6);assignin('base','Y6',Y6);assignin('base','Z6',Z6);
assignin('base','X7',X7);assignin('base','Y7',Y7);assignin('base','Z7',Z7);
assignin('base','X8',X8);assignin('base','Y8',Y8);assignin('base','Z8',Z8);
assignin('base','X9',X9);assignin('base','Y9',Y9);assignin('base','Z9',Z9);
assignin('base','X11',X11);assignin('base','Y11',Y11);assignin('base','Z11',Z11);
assignin('base','X12',X12);assignin('base','Y12',Y12);assignin('base','Z12',Z12);

assignin('base','X14',X14);assignin('base','Y14',Y14);assignin('base','Z14',Z14);
assignin('base','X15',X15);assignin('base','Y15',Y15);assignin('base','Z15',Z15);
assignin('base','X16',X16);assignin('base','Y16',Y16);assignin('base','Z16',Z16);

assignin('base','x2',x2);assignin('base','y2',y2);assignin('base','z2',z2);
assignin('base','x3',x3);assignin('base','y3',y3);assignin('base','z3',z3);
assignin('base','x4',x4);assignin('base','y4',y4);assignin('base','z4',z4);
assignin('base','x6',x6);assignin('base','y6',y6);assignin('base','z6',z6);
assignin('base','x5',x5);assignin('base','y5',y5);assignin('base','z5',z5);
assignin('base','T5',T5);assignin('base','T6',T6);

assignin('base','x7',x7);assignin('base','y7',y7);assignin('base','z7',z7);
assignin('base','x8',x8);assignin('base','y8',y8);assignin('base','z8',z8);
assignin('base','x9',x9);assignin('base','y9',y9);assignin('base','z9',z9);

assignin('base','Rtz',Rtz);assignin('base','Rty',Rty);
end
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% assignin('base','X1',X1);% assignin('base','Y1',Y1);% assignin('base','Z1',Z1);
% assignin('base','X4',X4);assignin('base','Y4',Y4);assignin('base','Z4',Z4);
% assignin('base','Y10',Y10);assignin('base','Z10',Z10);

%>>>>>>>>>>>>>>>>>>>>输出ADAMS>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%绝对坐标
for nn=1:1:1
if get(handles.checkbox2,'Value')
    [filename pathname]=uigetfile({'*.xlsx';'*.xls'},'Choose a File');
    dizhi=[pathname filename];
    ZBX=[ x4+1,x4,x6,x5+x4,L ,X7,X2,X8,x3+x4,x2,L,X11,X12,X5,X3,X6,X9,L]';
    ZBY=[ y4,y4,y6,y5+y4,200 ,Y7,Y2,Y8,y3+y4,y2,0,Y11,Y12,Y5,Y3,Y6,Y9,0]';
    ZBZ=[ z4,z4,z6,z5+z4,0 ,Z7,Z2,Z8,z3+z4,z2,45,Z11,Z12,Z5,Z3,Z6,0,Z9]';
    ZB=[ZBX,ZBY,ZBZ];
    xlswrite(dizhi,ZB,'Sheet1','G2:I19');
end
end
%>>>>>>>>>>>>>>>>>>>>>>>>>CAD图>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if get(handles.radiobutton7,'Value')
for nn=1:1:1
figure(1)
subplot(221)
hold on;grid on
xlabel('y');ylabel('z')
line([-y2,-y3+-y4],[z2,z3+z4]);
line([-y4,-y3+-y4],[z4,z3+z4]);
line([-y4,-y5+-y4],[z4,z5+z4]);
line([-y4,-y7+-y4],[z4,z7+z4]);
line([-y6,-y5+-y4],[z6,z5+z4]);
line([-y3+-y4,-y5+-y4],[z3+z4,z5+z4]);
line([-y3+-y4,-y7+-y4],[z3+z4,z7+z4]);
line([-y8,-y7+-y4],[z8,z7+z4]);
line([-y8,-y9],[z8,z9]);
line([-Y2,-Y3],[Z2,Z3]);
line([-Y7,-Y2],[Z7,Z2]);
line([-Y8,-Y2],[Z8,Z2]);
line([-Y3,-Y5],[Z3,Z5],'Color','r');%上A臂
line([-Y3,-Y6],[Z3,Z6],'Color','r');%上A臂
subplot(222)
xlabel('x');ylabel('z')
hold on;grid on
line([x2,x3+x4],[z2,z3+z4]);
line([x4,x3+x4],[z4,z3+z4]);
line([x4,x5+x4],[z4,z5+z4]);
line([x4,x7+x4],[z4,z7+z4]);
line([x6,x5+x4],[z6,z5+z4]);
line([x3+x4,x5+x4],[z3+z4,z5+z4]);
line([x3+x4,x7+x4],[z3+z4,z7+z4]);
line([x8,x7+x4],[z8,z7+z4]);
line([x8,x9],[z8,z9]);
line([X2,X3],[Z2,Z3]);
line([X7,X2],[Z7,Z2]);
line([X8,X2],[Z8,Z2]);
line([X3,X5],[Z3,Z5],'Color','r');%上A臂
line([X3,X6],[Z3,Z6],'Color','r');%上A臂
subplot(223)
xlabel('y');ylabel('x')
hold on;grid on
line([-y2,-y3+-y4],[x2,x3+x4]);
line([-y4,-y3+-y4],[x4,x3+x4]);
line([-y4,-y5+-y4],[x4,x5+x4]);
line([-y4,-y7+-y4],[x4,x7+x4]);
line([-y6,-y5+-y4],[x6,x5+x4]);
line([-y3+-y4,-y5+-y4],[x3+x4,x5+x4]);
line([-y3+-y4,-y7+-y4],[x3+x4,x7+x4]);
line([-y8,-y7+-y4],[x8,x7+x4]);
line([-y8,-y9],[x8,x9]);
line([-Y2,-Y3],[X2,X3]);
line([-Y7,-Y2],[X7,X2]);
line([-Y8,-Y2],[X8,X2]);
line([-Y3,-Y5],[X3,X5],'Color','r');%上A臂
line([-Y3,-Y6],[X3,X6],'Color','r');%上A臂
subplot(224)
hold on;%grid on
plot3([x2,x3+x4],[-y2,-y3+-y4],[z2,z3+z4]);
plot3([x4,x3+x4],[-y4,-y3+-y4],[z4,z3+z4]);
plot3([x4,x5+x4],[-y4,-y5+-y4],[z4,z5+z4]);
plot3([x4,x7+x4],[-y4,-y7+-y4],[z4,z7+z4]);
plot3([x6,x5+x4],[-y6,-y5+-y4],[z6,z5+z4]);
plot3([x3+x4,x5+x4],[-y3+-y4,-y5+-y4],[z3+z4,z5+z4]);
plot3([x3+x4,x7+x4],[-y3+-y4,-y7+-y4],[z3+z4,z7+z4]);
plot3([x8,x7+x4],[-y8,-y7+-y4],[z8,z7+z4]);
plot3([x8,x9],[-y8,-y9],[z8,z9]);
plot3([X2,X3],[-Y2,-Y3],[Z2,Z3]);
plot3([X7,X2],[-Y7,-Y2],[Z7,Z2]);
plot3([X8,X2],[-Y8,-Y2],[Z8,Z2]);
plot3([X3,X5],[-Y3,-Y5],[Z3,Z5],'r');%上A臂
plot3([X3,X6],[-Y3,-Y6],[Z3,Z6],'r');%上A臂
end
end
%>>>>>>>>>simulink仿真>>>>>>>>>>>>
   sim('Rear_SUS_S')
     clc
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
run('Rear_SUS_CeLiang.m')


