global dizhi
T=10;%����ʱ��
%>>>>>>>>>>>>>��ǰ�����ĵ�Ϊԭ������----ISO_������>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%>>>>>>>>>>>����>>>>>>>>>>>>>>>>>>>>
LT=str2double(get(handles.LT,'string'));%��LT=1ʱ����ƽ������
ST=str2double(get(handles.ST,'string'));% ST�൱�ڳ����г�
ST_S=str2double(get(handles.ST_S,'string'));%ST_S �����̶��г̡��൱�ڹ̶�������ת��

%>>>>>>>>>��ǰ������Ϊԭ�㣬���� Ӳ��>>>>>>>>>>>>>>>>
X9=str2double(get(handles.X9,'string'));%��̥�ӵ����ĵ� X����
Y9=str2double(get(handles.Y9,'string'));%��̥�ӵ����ĵ� Y����
Z9=str2double(get(handles.Z9,'string'));%��̥�ӵ����ĵ� Z����

x6=str2double(get(handles.x6,'string'));%���ᳵ�ܽӵ� X����
y6=str2double(get(handles.y6,'string'));%���ᳵ�ܽӵ� Y����
z6=str2double(get(handles.z6,'string'));%���ᳵ�ܽӵ� Z����

x4=str2double(get(handles.x4,'string'));
y4=str2double(get(handles.y4,'string'));
z4=str2double(get(handles.z4,'string'));%���ᳵ�ܽӵ�

%>>>>>>>>>>>>>>���ֶ�λ����>>>>>>>>>>>>>>>>>>>>
toe=str2double(get(handles.toe,'string')); %ǰ��
camber=str2double(get(handles.camber,'string'));%��������
IN=str2double(get(handles.IN,'string'));%Inclination angle ���������
CA=str2double(get(handles.CA,'string'));%Caster angle ��������
L=str2double(get(handles.L,'string'));%���
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%>>>>>>>>>>���� rear view>>>>>>>>>>>>>>
for nn=1:1:1
    H=str2double(get(handles.H,'string'));%�������ĸ�
    SR=str2double(get(handles.SR,'string'));%scrub radius
    Z3=str2double(get(handles.Z3,'string'));%�Ϻ��outer��Z����
    T4=str2double(get(handles.T4,'string'));%�Ϻ�۽Ƕ���ˮƽ��н�
    Z2=str2double(get(handles.Z2,'string'));%�º��outer��Z����
    Y1=str2double(get(handles.Y1,'string'));%�º��inner��Y����
    Y4=str2double(get(handles.Y4,'string'));%�Ϻ��inner��Y����

    T3=IN+90; %������Y��н�
    K9_10=-H/Y9;%��̥�ӵ��е��������������б��
    K2_3=tand(T3);%��������б��
    K3_4=tand(T4);%�Ϻ��б��
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
%>>>>>>>���ܲ���>>>>>>>>>>>>>>>>>
for nn=1:1:1
    %>>>>>>>>>>>>���ܲ��Ӽ���>>>>>>>>>>>>>>>>>>>>>
    T5=str2double(get(handles.T5,'string'));%�Ϻ����ת���� ˳ʱ��Ϊ��
    T6=str2double(get(handles.T6,'string'));%�º����ת����
    a1=str2double(get(handles.a1,'string'));% �Ϻ�۹�outer�㣬�����߽���һ�㣬�õ㵽 innerǰ�����
    b1=str2double(get(handles.b1,'string'));% ��inner������
    a2=str2double(get(handles.a2,'string'));% �º��
    b2=str2double(get(handles.b2,'string'));
    
    X4=0;X1=0;%>>>>>>>>>>>>
    X2=-abs(Z3)*tand(CA);  %�����������㣬����outer���X�����б䶯
    X3=abs(Z2)*tand(CA);
    X5=X4-a1*cosd(T5);Y5=Y4;Z5=Z4-a1*sind(T5);%�Ϻ�� inner ǰ�� ��inner�� X4 Y4 Z4 a1Ϊ��inner�㵽��innerǰ�����
    X6=X4+b1*cosd(T5);Y6=Y4;Z6=Z4+b1*sind(T5);%�Ϻ�� inner ���  b1Ϊ��inner�㵽��inner������
    X7=X1-a2*cosd(T6);Y7=Y1;Z7=Z1-a2*sind(T6);%�º�� inner ǰ��  ��inner�� X1 Y1 Z1 a2Ϊ��inner�㵽��innerǰ�����
    X8=X1+b2*cosd(T6);Y8=Y1;Z8=Z1+b2*sind(T6);%�º�� inner ���   b2Ϊ��inner�㵽��inner������
end
%>>>>>>>>>>>>>>>>>����>>>>>>>>>>>>>>>����������ʱ��>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
l2=str2double(get(handles.l2,'string'));   %�º��inner�㵽�º���Ƹ˽ӵ� 
l4=str2double(get(handles.l4,'string'));   %ҡ��-�Ƹ˱�
l5=str2double(get(handles.l5,'string'));   %ҡ��-�����
t2=str2double(get(handles.t2,'string'));
t4=str2double(get(handles.t4,'string')); %ҡ��-�Ƹ˱� �н�
t5=str2double(get(handles.t5,'string'));t5=t5+t4;  %ҡ��-�������� �н�

x2=0;y2=Y1+l2*cosd(t2+T2);z2=Z1+l2*sind(t2+T2);%�Ƹ��º�۽ӵ� 
x3=0;y3=y4+l4*cosd(t4);z3=z4+l4*sind(t4);%�Ƹ�ҡ�۽ӵ�
x5=0;y5=y4+l5*cosd(t5);z5=z4+l5*sind(t5);%ҡ������ӵ�
lengthZ=((y5-y6).^2+(z5-z6).^2+(x5-x6).^2).^0.5; %����ԭ��
%Z-bar
for nnn=1:1:1 
t7=str2double(get(handles.t7,'string')); 
e7=str2double(get(handles.e7,'string')); 
t8=str2double(get(handles.t8,'string')); 
l7=str2double(get(handles.l7,'string')); 
l8=str2double(get(handles.l8,'string')); 
x9=str2double(get(handles.x9,'string')); 
y9=str2double(get(handles.y9,'string')); 
z9=str2double(get(handles.z9,'string')); 
% e7=30;l7=40;t7=30;x9=0;y9=0;z9=400;l8=100;t8=90;
x8=x9-l8*sind(t8);y8=y9+l8*cosd(t8);z8=z9;%����
x7=x4-e7;y7=y4+l7*cosd(t7);z7=z4+l7*sind(t7);
end
end
%>>>>>>>>>>>>>ת��>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
M=str2double(get(handles.M,'string'));
LL1=str2double(get(handles.LL1,'string'));
r=str2double(get(handles.r,'string'));
a=str2double(get(handles.a,'string'));  
Z11=str2double(get(handles.Z11,'string'));%������inner�� �����߶�
k2_3=(Z2-Z3)/(X2-X3); %k2_3�������� б��
b2_3=Z3-k2_3*X3;
Y11=M/2;%������inner������˳���
K11_12=(Z10-Z11)/(Y10-Y11);%���� ������б��(��˲����õ�б��)
B11_12=Z11-K11_12*Y11;
X12_1=-LL1*sind(r);%δ��תǰ����ά��ͼ 
Y12_1=-LL1*cosd(r);
X12_2=X12_1;
Y12_2=Y12_1*cosd(IN);%��һ����ת�����㣬��X��ת 
Z12_2=Y12_1*sind(IN);
l_12=(X12_2^2+Z12_2^2)^0.5;
theta_12=abs(atand(Z12_2/X12_2));
X12_3=-l_12*cosd(theta_12-CA);%�ڶ�����ת�����㣬��Y��ת  %2015.4.03��
Y12_3=Y12_2;
Z12_3=-l_12*sind(theta_12-CA);
bb2_3=(Z2+Z12_3)-k2_3*(X2+X12_3);%���ӣ�������outer������ֱ�߷��̵ģ�bֵ
BB2_3=(Z2+Z12_3)-K2_3*(Y2+Y12_3);%���ӣ�������outer������ֱ�߷��̵ģ�Bֵ
if get(handles.radiobutton5,'Value')
    %�Զ��壬����˲�ĵ�������ʱ��ǰ���仯
    Z12=str2double(get(handles.Z12,'string'));
    Y12=(Z12-BB2_3)/K2_3;
else
    %�����˹�˲��
    Y12=(B11_12-BB2_3)/(K2_3-K11_12);  %������outer�� ��ֱ�߽������
    Z12=K11_12*Y12+B11_12;%>>>>>>>>>>>>>>>>>������2015/03/30
end
Y13=Y12-Y12_3;Z13=Z12-Z12_3; %������outer���� ��������ת��
K=Y13*2; %�־�
LL2=((K-M-2*LL1*cosd(r))/2)/cosd(a) ; 
H=LL1*sind(r)-LL2*sind(a);
X11=(Z11-H/sind(CA)-b2_3)/k2_3;
X12=(Z12-bb2_3)/k2_3;
X13=X12-X12_3;
% XX14=X12-X13;YY14=Y12-Y13;ZZ14=Z12-Z13;YY12=Y12;
end
%>>>>>>>���� simulink�� ����׼ȷ��>>>>>>>>>>>
XC1=(X7+X2+X8)/3;YC1=(Y7+Y2+Y8)/3;ZC1=(Z7+Z2+Z8)/3;%�º��
XC2=(X3+X2)/2;YC2=(Y3+Y2)/2;ZC2=(Z3+Z2)/2;%����
XC3=(X5+X3+X6)/3;YC3=(Y5+Y3+Y6)/3;ZC3=(Z5+Z3+Z6)/3;%�Ϻ��
xc1=(x3+x4+x5)/3;yc1=(y3+y4+y5)/3;zc1=(z3+z4+z5)/3;%ҡ��
%>>>>>>>>>>>>>>>������>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
%>>>>>>>>>>>>>>>>>�ȳ������㣬��ǰ��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%ע������ǰ��ʱ�����ܴ�Сֻ�ܷ��򣬸��ӽ�
L16=100;
X16_1=0;Y16_1=-L16*cosd(camber);Z16_1=L16*sind(camber); %����� ������
X16_2=abs(Y16_1)*sind(toe);Y16_2=Y16_1*cosd(toe);Z16_2=Z16_1;%ǰ�����޹ش�Сֻ�ܷ��򣬸��ӣ�
X16=X9+X16_2;Y16=Y9+Y16_2;Z16=Z9+Z16_2;
L14=abs(Z9);
X14_1=-L14*cosd(toe);Y14_1=-L14*sind(toe);Z14_1=0;%ǰ��
X14=X9+X14_1;Y14=Y9+Y14_1;    Z14=Z9+Z14_1;

L15=abs(Z9);
X15_1=L15*cosd(toe);Y15_1=L15*sind(toe);Z15_1=0;%ǰ��
X15=X9+X15_1;Y15=Y9+Y15_1;     Z15=Z9+Z15_1;
end
%>>>>>>>>>>>>>>>>>>>>>>>�����base simulink��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
assignin('base','T',T);assignin('base','LT',LT);assignin('base','ST',ST);assignin('base','ST_S',ST_S);
assignin('base','X1',X1);assignin('base','Y1',Y1);assignin('base','Z1',Z1);
assignin('base','X2',X2);assignin('base','Y2',Y2);assignin('base','Z2',Z2);
assignin('base','X3',X3);assignin('base','Y3',Y3);assignin('base','Z3',Z3);
assignin('base','X4',X4);assignin('base','Y4',Y4);assignin('base','Z4',Z4);
assignin('base','X5',X5);assignin('base','Y5',Y5);assignin('base','Z5',Z5);
assignin('base','X6',X6);assignin('base','Y6',Y6);assignin('base','Z6',Z6);
assignin('base','X7',X7);assignin('base','Y7',Y7);assignin('base','Z7',Z7);
assignin('base','X8',X8);assignin('base','Y8',Y8);assignin('base','Z8',Z8);
assignin('base','X9',X9);assignin('base','Y9',Y9);assignin('base','Z9',Z9);
assignin('base','Y10',Y10);assignin('base','Z10',Z10);
assignin('base','X11',X11);assignin('base','Y11',Y11);assignin('base','Z11',Z11);
assignin('base','X12',X12);assignin('base','Y12',Y12);assignin('base','Z12',Z12);
assignin('base','X13',X13);assignin('base','Y13',Y13);assignin('base','Z13',Z13);
assignin('base','X14',X14);assignin('base','Y14',Y14);assignin('base','Z14',Z14);
assignin('base','X15',X15);assignin('base','Y15',Y15);assignin('base','Z15',Z15);
assignin('base','X16',X16);assignin('base','Y16',Y16);assignin('base','Z16',Z16);
assignin('base','Y12_3',Y12_3);assignin('base','X12_3',X12_3);assignin('base','Z12_3',Z12_3);

assignin('base','xc1',xc1);assignin('base','yc1',yc1);assignin('base','zc1',zc1);
assignin('base','XC1',XC1);assignin('base','YC1',YC1);assignin('base','ZC1',ZC1);
assignin('base','XC2',XC2);assignin('base','YC2',YC2);assignin('base','ZC2',ZC2);
assignin('base','XC3',XC3);assignin('base','YC3',YC3);assignin('base','ZC3',ZC3);

assignin('base','x2',x2);assignin('base','y2',y2);assignin('base','z2',z2);
assignin('base','x3',x3);assignin('base','y3',y3);assignin('base','z3',z3);
assignin('base','x4',x4);assignin('base','y4',y4);assignin('base','z4',z4);
assignin('base','x5',x5);assignin('base','y5',y5);assignin('base','z5',z5);
assignin('base','x6',x6);assignin('base','y6',y6);assignin('base','z6',z6);
assignin('base','x7',x7);assignin('base','y7',y7);assignin('base','z7',z7);
assignin('base','x8',x8);assignin('base','y8',y8);assignin('base','z8',z8);
assignin('base','x9',x9);assignin('base','y9',y9);assignin('base','z9',z9);

assignin('base','T5',T5);assignin('base','T6',T6);
assignin('base','IN',IN);assignin('base','CA',CA);assignin('base','L',L);
assignin('base','SR',SR);
assignin('base','lengthZ',lengthZ);
end
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>���ADAMS>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1
if get(handles.checkbox2,'Value')
[filename pathname]=uigetfile({'*.xls';'*.xlsx'},'Choose a File');
dizhi=[pathname filename];
X10=0;
ZBX=[ x4+1,x4,x6,x5,X7,X2,X8,x3,x2,0,X11,X12,X5,X3,X6]';
ZBY=[ y4,y4,y6,y5,Y7,Y2,Y8,y3,y2,0,Y11,Y12,Y5,Y3,Y6]';
ZBZ=[ z4,z4,z6,z5,Z7,Z2,Z8,z3,z2,0,Z11,Z12,Z5,Z3,Z6]';
ZB=[ZBX,ZBY,ZBZ];
xlswrite(dizhi,ZB,'Sheet1','G2:I16');
end
end
%>>>>>>>>>>>>>>>>>>>>>>>>>CADͼ>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if get(handles.fi_CAD,'Value')
for nn=1:1:1
figure(1)
subplot(221)
hold on;grid on
xlabel('y');ylabel('z')
line([-y2,-y3],[z2,z3]);
line([-y4,-y3],[z4,z3]);
line([-y4,-y5],[z4,z5]);
line([-y4,-y7],[z4,z7]);
line([-y6,-y5],[z6,z5]);
line([-y3,-y5],[z3,z5]);
line([-y3,-y7],[z3,z7]);
line([-y8,-y7],[z8,z7]);
line([-y8,-y9],[z8,z9]);
line([-Y2,-Y3],[Z2,Z3]);
line([-Y7,-Y2],[Z7,Z2]);
line([-Y8,-Y2],[Z8,Z2]);
line([-Y3,-Y5],[Z3,Z5],'Color','r');%��A��
line([-Y3,-Y6],[Z3,Z6],'Color','r');%��A��
subplot(222)
xlabel('x');ylabel('z')
hold on;grid on
line([x2,x3],[z2,z3]);
line([x4,x3],[z4,z3]);
line([x4,x5],[z4,z5]);
line([x4,x7],[z4,z7]);
line([x6,x5],[z6,z5]);
line([x3,x5],[z3,z5]);
line([x3,x7],[z3,z7]);
line([x8,x7],[z8,z7]);
line([x8,x9],[z8,z9]);
line([X2,X3],[Z2,Z3]);
line([X7,X2],[Z7,Z2]);
line([X8,X2],[Z8,Z2]);
line([X3,X5],[Z3,Z5],'Color','r');%��A��
line([X3,X6],[Z3,Z6],'Color','r');%��A��
subplot(223)
xlabel('y');ylabel('x')
hold on;grid on
line([-y2,-y3],[x2,x3]);
line([-y4,-y3],[x4,x3]);
line([-y4,-y5],[x4,x5]);
line([-y4,-y7],[x4,x7]);
line([-y6,-y5],[x6,x5]);
line([-y3,-y5],[x3,x5]);
line([-y3,-y7],[x3,x7]);
line([-y8,-y7],[x8,x7]);
line([-y8,-y9],[x8,x9]);
line([-Y2,-Y3],[X2,X3]);
line([-Y7,-Y2],[X7,X2]);
line([-Y8,-Y2],[X8,X2]);
line([-Y3,-Y5],[X3,X5],'Color','r');%��A��
line([-Y3,-Y6],[X3,X6],'Color','r');%��A��
subplot(224)
hold on;%grid on
plot3([x2,x3],[-y2,-y3],[z2,z3]);
plot3([x4,x3],[-y4,-y3],[z4,z3]);
plot3([x4,x5],[-y4,-y5],[z4,z5]);
plot3([x4,x7],[-y4,-y7],[z4,z7]);
plot3([x6,x5],[-y6,-y5],[z6,z5]);
plot3([x3,x5],[-y3,-y5],[z3,z5]);
plot3([x3,x7],[-y3,-y7],[z3,z7]);
plot3([x8,x7],[-y8,-y7],[z8,z7]);
plot3([x8,x9],[-y8,-y9],[z8,z9]);
plot3([X2,X3],[-Y2,-Y3],[Z2,Z3]);
plot3([X7,X2],[-Y7,-Y2],[Z7,Z2]);
plot3([X8,X2],[-Y8,-Y2],[Z8,Z2]);
plot3([X3,X5],[-Y3,-Y5],[Z3,Z5],'r');%��A��
plot3([X3,X6],[-Y3,-Y6],[Z3,Z6],'r');%��A��
end
end

% X12,Y12,Z12
%>>>>>>>>>simulink����>>>>>>>>>>>>
   sim('SUS_ST_GUI')
      clc
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
run('SUS_CeLiang_GUI.m')



