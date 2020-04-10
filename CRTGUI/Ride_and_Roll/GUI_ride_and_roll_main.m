% clear,clc
%侧倾刚度 N*mm/deg
%质量 kg
%长度 mm
%加速度 mm/s^2
%速度 mm/s
%刚度 N/mm
%!!!计算核心：单位匹配（用此查错）
%>>>>>基础数据>>>>>单位（ 长度m 质量kg 速度m/s 加速度g）>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Wbcw=str2double(get(handles.Wbcw,'string'));% kg 空载质量
Wd=str2double(get(handles.Wd,'string'));% kg 车手质重
aa=str2double(get(handles.aa,'string'));%载荷-前轴-分配
bb=1-aa;%载荷-后轴-分配

tF=str2double(get(handles.tF,'string'));%mm 前轮距
tR=str2double(get(handles.tR,'string'));%mm 后轮距
l=str2double(get(handles.l,'string'));%mm 轴距
h=str2double(get(handles.h,'string'));%mm 质心高度
zRF=str2double(get(handles.zRF,'string'));%mm 假定前侧倾中心45mm
zRR=str2double(get(handles.zRR,'string'));%mm 后侧倾中心60mm
hUSF=str2double(get(handles.hUSF,'string'));%mm 前簧下质心高
hUSR=str2double(get(handles.hUSR,'string'));%mm 后簧下质心高
%>>>>>>>>>单轴簧下质量>>>>>>
WUSF=str2double(get(handles.WUSF,'string'));% kg 前轴簧下
WUSR=str2double(get(handles.WUSR,'string'));% kg 后轴簧下
%>>>>>工况>>>>>>>水平路面无倾角
R=-str2double(get(handles.R,'string'));%半径 -9.125
V=str2double(get(handles.V,'string'));%(m/s) 41.9518 湖大 ； 48.1449 2g ； 34.15 1g
AY=V*V/R/9.8*1000;%Horizontal lateral acceleration (g)
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
hRM=hS-(zRF+(zRR-zRF)*(1-WSF/WTS));
% hSRD=hS-(zRF+(zRR-zRF.*(1-WSF./WTS))).*l./(l.^2+(zRR-zRF).^2).^0.5;%mm
%>>>>>>>>>>侧倾梯度（deg/g）>>>>>>>>>>>>>>>>>>>>
RG=str2double(get(handles.RG,'string'));%（deg/g） 目标值
a=str2double(get(handles.a,'string'));%载荷转移比例  
Kfai=(WTS*9.8*hRM)/RG;%（N.mm/deg）算的簧上质量
Tave=(tR+tF)/2;%mm
TL=WT*h/Tave;%total load transfer  （kg/g） 每个g的载荷转移量
KfaiF=(a*TL*tF-WSF*zRF-WUSF*hUSF)*9.8/RG;%（N.mm/deg） front roll stiffness前悬侧倾刚度 4.20改
KfaiR=Kfai-KfaiF;%后悬侧倾刚度 （N.mm/deg）
%>>>>>>>>>>载荷转移>>>>>>>>>>>>>>>>>
deltWF=AY*WT/tF*(h*KfaiF/(KfaiF+KfaiR)+aa*zRF);%kg
deltWR=AY*WT/tR*(h*KfaiR/(KfaiF+KfaiR)+bb*zRR);%kg
%车轮载荷  kg
WFO=WF./2-deltWF;
WRO=WR./2-deltWR;
WFI=WF./2+deltWF;
WRI=WR./2+deltWR;
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%>>>>>>>>>>>>>前悬>>>>>>>>>>单位：长度 m 质量kg 刚度 N/m 侧倾刚度（kg.m/deg）>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%定偏频
wF=str2double(get(handles.wF,'string'));
%定弹簧刚度，求MR
KSF=str2double(get(handles.KSF,'string'));% N/mm 前螺旋弹簧刚度
KTF=str2double(get(handles.KTF,'string'));%轮胎垂向刚度 N/mm  86.2789 2015.4.15改
KRSF=(wF*2*pi).^2*(WF/2)/1000;  %N/mm等效悬架刚度，与簧上簧下质量都有关固取单轮总质量
KWSF=(KRSF*KTF)./(KTF-KRSF);%N/mm 弹簧提供的轮心线刚度
KfaiSF=KRSF*tF^2/2/180*pi;%（N.mm/deg）
MR_F=(KWSF./KSF).^0.5;%弹簧的 MR 值

%>>>>>>>>>>>>>后悬>>>>>>>>>单位：长度 m 质量kg 刚度 N/m 侧倾刚度（kg.m/deg） >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%定偏频
wR=str2double(get(handles.wR,'string'));
%定弹簧刚度，求MR
KSR=str2double(get(handles.KSR,'string'));% N/mm 后螺旋弹簧刚度
KTR=str2double(get(handles.KTR,'string'));%轮胎垂向刚度 N/mm  86.2789 2015.4.15改 (10psi 86.2789N/mm 493lb/in)
KRSR=(wR*2*pi).^2*(WR/2)/1000;  %N/mm 弹簧提供的等效悬架刚度
KWSR=(KRSR*KTR)./(KTR-KRSR);%N/mm 弹簧提供的轮心线刚度
KfaiSR=KRSR*tR^2/2/180*pi;%（N.mm/deg）
MR_R=(KWSR./KSR).^0.5;%弹簧提供的 MR 值

%>>>>>>>>>>>>>后悬U-Bar>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBR=str2double(get(handles.KBR,'string'));% N*mm/deg 后U-BAr扭杆弹簧刚度 2015/7/3
KfaiR_T=KTR*tR^2/2/180*pi;% N*mm/deg
KfaiR_S=KWSR.*tR^2/2/180*pi;% N*mm/deg
KfaiR_W=KfaiR*KfaiR_T/(KfaiR_T-KfaiR);% N*mm/deg 后悬架侧倾角刚度
KfaiR_B=KfaiR_W-KfaiR_S;% N*mm/deg
MR_BR=(KfaiR_B./KBR).^0.5/pi/tR*180;%deg/mm
%>>>>>>>>>>>>>前悬U-Bar>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBF=str2double(get(handles.KBF,'string'));% N*mm/deg 前U-BAr扭杆弹簧刚度 4420
KfaiF_T=KTF*tF^2/2/180*pi;% N*mm/deg
KfaiF_S=KWSF.*tF^2/2/180*pi;% N*mm/deg
KfaiF_W=KfaiF*KfaiF_T/(KfaiF_T-KfaiF);%前悬架侧倾角刚度
KfaiF_B=KfaiF_W-KfaiF_S;% N*mm/deg
MR_BF=(KfaiF_B./KBF).^0.5/pi/tF*180;%deg/mm
% %>>>>>>>>>>>>>>>>输出>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
fprintf('前悬 MR_F= %d  \n',MR_F)
fprintf('后悬 MR_R= %d  \n\n',MR_R)
fprintf('前悬 U-Bar MR_BF= %d deg/mm \n',MR_BF)
fprintf('后悬 U-Bar MR_BR= %d deg/mm \n\n',MR_BR)
fprintf('前悬 KfaiF= %d N mm/deg \n',KfaiF)
fprintf('后悬 KfaiR= %d N mm/deg \n\n',KfaiR)
fprintf('前悬 KfaiSF= %d N mm/deg \n',KfaiSF)
fprintf('后悬 KfaiSR= %d N mm/deg \n\n',KfaiSR)

fprintf('前外轮= %d N \n',WFO*9.8);
fprintf('前内轮= %d N \n',WFI*9.8);
fprintf('后外轮= %d N \n',WRO*9.8);
fprintf('后内轮= %d N \n\n',WRI*9.8);

fprintf('KWSF= %d N/mm \n',KWSF);
fprintf('KWSR= %d N/mm \n',KWSR);

fprintf('前悬防侧倾杆提供 悬架侧倾角刚度 KfaiF_B= %d N/mm \n',KfaiF_B);
fprintf('后悬防侧倾杆提供 悬架侧倾角刚度 KfaiR_B= %d N/mm \n',KfaiR_B);

% % %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% FO=1004/9.8;
% FI=391/9.8;
% RO=1159/9.8;
% RI=447/9.8;%kg
% DELT=[WFO,WFI,WRO,WRI]-[FO,FI,RO,RI];
% DELTS=['DELT_FO= %3.2d kg \n','DELT_FI= %3.2d kg \n','DELT_RO= %3.2d kg \n','DELT_RI= %3.2d kg \n'];
% fprintf('与ADAMS相差\n')
% fprintf(DELTS,DELT);