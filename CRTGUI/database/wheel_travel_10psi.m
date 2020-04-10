clear,clc
%侧倾刚度 N*mm/deg
%质量 kg
%长度 mm
%加速度 mm/s^2
%速度 mm/s
%刚度 N/mm
%!!!计算核心：单位匹配（用此查错）
%以下循环语句 for nn=1:1:1 为方便查看用而设置
%>>>>>>>>>>>>>>>导入MR数据>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1;
% dizhi=uigetdir; 
dizhi='G:\MATLAB\Car\GUI\database\CRT';
load([dizhi '\' 'WT_R.mat'],'WT_R');
load([dizhi '\' 'MR_R.mat'],'MR_R');
load([dizhi '\' 'WT_F.mat'],'WT_F');
load([dizhi '\' 'MR_F.mat'],'MR_F');
load([dizhi '\' 'MR_BR.mat'],'MR_BR');
load([dizhi '\' 'MR_BF.mat'],'MR_BF');
load([dizhi '\' 't9R.mat'],'t9R');
load([dizhi '\' 't9F.mat'],'t9F');
load([dizhi '\' 'length_R.mat'],'length_R');
load([dizhi '\' 'length_F.mat'],'length_F');
WT_R=WT_R(2:size(WT_R,1),1);%后悬轮跳，保持相同数组
WT_F=WT_F(2:size(WT_F,1),1);%前悬轮跳，保持相同数组
length_R=length_R(2:size(length_R,1),1);%前悬轮跳，保持相同数组
length_F=length_F(2:size(length_F,1),1);%前悬轮跳，保持相同数组
t9R=t9R(2:length(t9R));
t9F=t9F(2:length(t9F));
end

%>>>>>工况>>>>>>>水平路面无倾角
R=-9125;%半径 -9.125
V=48.1449/3.6;%(m/s) 41.9518 
AY=V*V/R/9.8*1000;%Horizontal lateral acceleration (g)
%>>>>>基础数据>>>>>单位（ 长度m 质量kg 速度m/s 加速度g）>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1 
Wbcw=230;% kg 空载质量
Wd=68;% kg 车手质重
aa=0.45;%载荷-前轴-分配
bb=1-aa;%载荷-后轴-分配

tF=1180;%mm 前轮距
tR=1160;%mm 后轮距
l=1580;%mm 轴距
h=300;%mm 质心高度
zRF=45;%mm 假定前侧倾中心45mm
zRR=60;%mm 后侧倾中心60mm
hUSF=228.6;%m 前簧下质心高
hUSR=228.6;%m 后簧下质心高
%>>>>>>>>>单轴簧下质量>>>>>>
WUSF=20.329478;% kg 前轴簧下
WUSR=20.729478;% kg 后轴簧下
%>>>>>>>>>总质量>>>>>>>>>>>>>>>>>>>>>>>>>>
WT=Wbcw+Wd;%总质量
WF=WT.*aa;%前轴总质量
WR=WT.*bb;%后轴总质量
%>>>>>>>>>单轮簧上质量>>>>>>>>>
WSFO=(WF-WUSF)./2;%kg
WSFI=(WF-WUSF)./2;%kg
WSRO=(WR-WUSR)./2;%kg
WSRI=(WR-WUSR)./2;%kg
%>>>>>>>>>单轴簧上质量>>>>>>>
WSF=WSFO+WSFI;%kg
WSR=WSRO+WSRI;%kg
%>>>>>>>>>总簧上质量>>>>>>>>>
WTS=WT-WUSF-WUSR;%kg
%>>>>簧上质量重心高度>>>>>>.
hS=(WT.*h-WUSF.*hUSF-WUSR.*hUSR)./WTS;%mm
hSRD=hS-(zRF+(zRR-zRF.*(1-WSF./WTS))).*l./(l.^2+(zRR-zRF).^2).^0.5;%mm
end

%>>>>>>>>>>>>>>>前悬>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%定弹簧刚度，求MR
KSF=78.75;% N/mm 前螺旋弹簧刚度
KTF=86.2789;%轮胎垂向刚度 N/mm  86.2789 10psi
KWSF=KSF.*MR_F.^2;%N/mm 弹簧提供的轮心线刚度
KRSF=(KWSF*KTF)./(KTF+KWSF);
KfaiSF=KRSF*tF^2/2/180*pi;%（N.mm/deg）
wF=(KRSF*1000*2/WF).^0.5/2/pi;
fprintf('前悬静载时偏频 %d mm\n',wF(length(wF)/2));%
fprintf('前悬静载时轮心线刚度 %d mm\n',KWSF(length(wF)/2));%

%>>>>>>>>>>>>>>>后悬>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%定弹簧刚度，求MR
KSR=78.75;%78.75;% N/mm 后螺旋弹簧刚度
KTR=86.2789;%轮胎垂向刚度 N/mm  86.2789 
KWSR=KSR.*MR_R.^2;
KRSR=(KWSR*KTR)./(KTR+KWSR);%N/mm 弹簧提供的轮心线刚度
KfaiSR=KRSR*tR^2/2/180*pi;%（N.mm/deg）
wR=(KRSR*1000*2/WR).^0.5/2/pi;
fprintf('后悬静载时偏频 %d mm\n',wR(length(wR)/2));%
fprintf('后悬静载时轮心线刚度 %d mm\n\n',KWSR(length(wR)/2));%
%>>>>>>>>>>>>>>>>>>>前悬静载轮跳计算>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1 
length_Fwt=max(WT_F)-min(WT_F);%总行程
buchang_F=length_Fwt/length(MR_F);%步长
sum_F=0;
for n=length(MR_F)/2:-1:1 %近似积分
    sum_F=KWSF(n)*buchang_F+sum_F;
     if sum_F<=WSF/2*9.8
         n_F=n;
         if n==1
             warning('弹簧或超出测量范围，从新确定范围')
         end
     end
end   
S_FS=WT_F(length(MR_F)/2)-WT_F(n_F);%轮心上跳量
S_FW=WF/2*9.8/KTF;%轮胎变形量
S_F=S_FS+S_FW;
fprintf('前悬轮胎下跳量 %d mm\n',S_F);%整车落地到静载，轮胎上跳量
fprintf('前悬静载时弹簧压缩量 %d mm\n',length_F(n_F)-length_F(length(MR_F)/2));%整车落地到静载，轮胎上跳量
fprintf('前悬下跳极限阻尼长 %d mm\n',length_F(n_F));%
fprintf('前悬静载时阻尼长 %d mm\n\n',length_F(length(MR_F)/2));%
end
%>>>>>>>>>>>>>>>>>>>后悬静载轮跳计算>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1 
length_Rwt=max(WT_R)-min(WT_R);%总行程
buchang_R=length_Rwt/length(MR_R);%步长
sum_R=0;
for n=length(MR_R)/2:-1:1 %近似积分
    sum_R=KWSR(n)*buchang_R+sum_R;
     if sum_R<=WSR/2*9.8
         n_R=n;
         if n==1
             warning('弹簧或超出测量范围，从新确定范围')
         end
     end
end   
S_RS=WT_R(length(MR_R)/2)-WT_R(n_R);%轮心上跳量
S_RW=WR/2*9.8/KTR;%轮胎变形量
S_R=S_RS+S_RW;
fprintf('后悬轮胎下跳量 %d mm\n',S_R);%整车落地到静载，轮胎接地点上跳量
fprintf('后悬静载时弹簧压缩量 %d mm\n',length_R(n_R)-length_R(length(MR_R)/2));%整车落地到静载，轮胎上跳量
fprintf('后悬下跳极限阻尼长 %d mm\n',length_R(n_R));%
fprintf('后悬静载时阻尼长 %d mm\n\n',length_R(length(MR_R)/2));%
end
%>>>>>>>>>>>>>>>>>>>后悬>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBR=20000;% N*mm/deg 后U-BAr扭杆弹簧刚度
KfaiR_B=(MR_BR.*tR*pi/180).^2*KBR;
KfaiR_T=KTR*tR^2/2/180*pi;
KfaiR_S=KWSR.*tR^2/2/180*pi;
KfaiR_W=KfaiR_B+KfaiR_S;%悬架侧倾刚度
KfaiR=(KfaiR_T.*KfaiR_W)./(KfaiR_T+KfaiR_W);
KfaiR_W(50),KfaiR(50)
% KfaiR=KfaiBR+KfaiSR;
% KfaiR(n_R:length(KfaiR)/2);
%>>>>>>>>>>>>>>>>>>>>>前悬>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBF=4420;% N*mm/deg 前U-BAr扭杆弹簧刚度
KfaiBF=KBF.*(MR_BF*pi*tF/180).^2;
KfaiF_T=KTF*tF^2/2/180*pi;
KfaiF_W=KfaiBF+KWSF.*tF^2/2/180*pi;%悬架侧倾刚度
KfaiF=(KfaiF_T.*KfaiF_W)./(KfaiF_T+KfaiF_W);
KfaiF(50)
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>图像>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% subplot(211)
% hold on,grid on;
% xlabel('轮跳 /mm ');ylabel('轮心线刚度 /mm ')
% plot(WT_F,KWSF,'r',WT_R,KWSR,'b')
% legend('前悬','后悬')
% subplot(212)
% hold on,grid on;
% xlabel('轮跳 /mm ');ylabel('等效悬架刚度 /mm ')
% plot(WT_F,KRSF,'r',WT_R,KRSR,'b')
% legend('前悬','后悬')

% %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% load('G:\MATLAB\Car\GUI\database\CRT\ADAMS_S.mat')
% load('G:\MATLAB\Car\GUI\database\CRT\ADAMS_T.mat')
% load('G:\MATLAB\Car\GUI\database\CRT\ADAMS_W.mat')
% subplot(121)
% plot(ADAMS_W,ADAMS_S,'r',WT_F,KfaiF_W,'b')
% subplot(122)
% plot(ADAMS_W,ADAMS_T,'r',WT_F,KfaiF,'b')
% /9.8/1000*180/pi
