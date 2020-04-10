% clear,clc
%����ն� N*mm/deg
%���� kg
%���� mm
%���ٶ� mm/s^2
%�ٶ� mm/s
%�ն� N/mm
%!!!������ģ���λƥ�䣨�ô˲����
%>>>>>��������>>>>>��λ�� ����m ����kg �ٶ�m/s ���ٶ�g��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Wbcw=str2double(get(handles.Wbcw,'string'));% kg ��������
Wd=str2double(get(handles.Wd,'string'));% kg ��������
aa=str2double(get(handles.aa,'string'));%�غ�-ǰ��-����
bb=1-aa;%�غ�-����-����

tF=str2double(get(handles.tF,'string'));%mm ǰ�־�
tR=str2double(get(handles.tR,'string'));%mm ���־�
l=str2double(get(handles.l,'string'));%mm ���
h=str2double(get(handles.h,'string'));%mm ���ĸ߶�
zRF=str2double(get(handles.zRF,'string'));%mm �ٶ�ǰ��������45mm
zRR=str2double(get(handles.zRR,'string'));%mm ���������60mm
hUSF=str2double(get(handles.hUSF,'string'));%mm ǰ�������ĸ�
hUSR=str2double(get(handles.hUSR,'string'));%mm ��������ĸ�
%>>>>>>>>>�����������>>>>>>
WUSF=str2double(get(handles.WUSF,'string'));% kg ǰ�����
WUSR=str2double(get(handles.WUSR,'string'));% kg �������
%>>>>>����>>>>>>>ˮƽ·�������
R=-str2double(get(handles.R,'string'));%�뾶 -9.125
V=str2double(get(handles.V,'string'));%(m/s) 41.9518 ���� �� 48.1449 2g �� 34.15 1g
AY=V*V/R/9.8*1000;%Horizontal lateral acceleration (g)
%>>>>>>>>>������>>>>>>>>>>>>>>>>>>>>>>>>>>
WT=Wbcw+Wd;%������
WF=WT.*aa;%ǰ��������
WR=WT.*bb;%����������
%>>>>>>>>>���ֻ�������>>>>>>>>>
WSFO=(WF-WUSF)./2;%kg
WSFI=(WF-WUSF)./2;%kg
WSRO=(WR-WUSR)./2;%kg
WSRI=(WR-WUSR)./2;%kg
%>>>>>>>>>�����������>>>>>>>
WSF=WSFO+WSFI;%kg
WSR=WSRO+WSRI;%kg
%>>>>>>>>>�ܻ�������>>>>>>>>>
WTS=WT-WUSF-WUSR;%kg
%>>>>�����������ĸ߶�>>>>>>.
hS=(WT.*h-WUSF.*hUSF-WUSR.*hUSR)./WTS;%mm
hRM=hS-(zRF+(zRR-zRF)*(1-WSF/WTS));
% hSRD=hS-(zRF+(zRR-zRF.*(1-WSF./WTS))).*l./(l.^2+(zRR-zRF).^2).^0.5;%mm
%>>>>>>>>>>�����ݶȣ�deg/g��>>>>>>>>>>>>>>>>>>>>
RG=str2double(get(handles.RG,'string'));%��deg/g�� Ŀ��ֵ
a=str2double(get(handles.a,'string'));%�غ�ת�Ʊ���  
Kfai=(WTS*9.8*hRM)/RG;%��N.mm/deg����Ļ�������
Tave=(tR+tF)/2;%mm
TL=WT*h/Tave;%total load transfer  ��kg/g�� ÿ��g���غ�ת����
KfaiF=(a*TL*tF-WSF*zRF-WUSF*hUSF)*9.8/RG;%��N.mm/deg�� front roll stiffnessǰ������ն� 4.20��
KfaiR=Kfai-KfaiF;%��������ն� ��N.mm/deg��
%>>>>>>>>>>�غ�ת��>>>>>>>>>>>>>>>>>
deltWF=AY*WT/tF*(h*KfaiF/(KfaiF+KfaiR)+aa*zRF);%kg
deltWR=AY*WT/tR*(h*KfaiR/(KfaiF+KfaiR)+bb*zRR);%kg
%�����غ�  kg
WFO=WF./2-deltWF;
WRO=WR./2-deltWR;
WFI=WF./2+deltWF;
WRI=WR./2+deltWR;
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%>>>>>>>>>>>>>ǰ��>>>>>>>>>>��λ������ m ����kg �ն� N/m ����նȣ�kg.m/deg��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%��ƫƵ
wF=str2double(get(handles.wF,'string'));
%�����ɸնȣ���MR
KSF=str2double(get(handles.KSF,'string'));% N/mm ǰ�������ɸն�
KTF=str2double(get(handles.KTF,'string'));%��̥����ն� N/mm  86.2789 2015.4.15��
KRSF=(wF*2*pi).^2*(WF/2)/1000;  %N/mm��Ч���ܸնȣ�����ϻ����������йع�ȡ����������
KWSF=(KRSF*KTF)./(KTF-KRSF);%N/mm �����ṩ�������߸ն�
KfaiSF=KRSF*tF^2/2/180*pi;%��N.mm/deg��
MR_F=(KWSF./KSF).^0.5;%���ɵ� MR ֵ

%>>>>>>>>>>>>>����>>>>>>>>>��λ������ m ����kg �ն� N/m ����նȣ�kg.m/deg�� >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%��ƫƵ
wR=str2double(get(handles.wR,'string'));
%�����ɸնȣ���MR
KSR=str2double(get(handles.KSR,'string'));% N/mm ���������ɸն�
KTR=str2double(get(handles.KTR,'string'));%��̥����ն� N/mm  86.2789 2015.4.15�� (10psi 86.2789N/mm 493lb/in)
KRSR=(wR*2*pi).^2*(WR/2)/1000;  %N/mm �����ṩ�ĵ�Ч���ܸն�
KWSR=(KRSR*KTR)./(KTR-KRSR);%N/mm �����ṩ�������߸ն�
KfaiSR=KRSR*tR^2/2/180*pi;%��N.mm/deg��
MR_R=(KWSR./KSR).^0.5;%�����ṩ�� MR ֵ

%>>>>>>>>>>>>>����U-Bar>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBR=str2double(get(handles.KBR,'string'));% N*mm/deg ��U-BArŤ�˵��ɸն� 2015/7/3
KfaiR_T=KTR*tR^2/2/180*pi;% N*mm/deg
KfaiR_S=KWSR.*tR^2/2/180*pi;% N*mm/deg
KfaiR_W=KfaiR*KfaiR_T/(KfaiR_T-KfaiR);% N*mm/deg �����ܲ���Ǹն�
KfaiR_B=KfaiR_W-KfaiR_S;% N*mm/deg
MR_BR=(KfaiR_B./KBR).^0.5/pi/tR*180;%deg/mm
%>>>>>>>>>>>>>ǰ��U-Bar>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBF=str2double(get(handles.KBF,'string'));% N*mm/deg ǰU-BArŤ�˵��ɸն� 4420
KfaiF_T=KTF*tF^2/2/180*pi;% N*mm/deg
KfaiF_S=KWSF.*tF^2/2/180*pi;% N*mm/deg
KfaiF_W=KfaiF*KfaiF_T/(KfaiF_T-KfaiF);%ǰ���ܲ���Ǹն�
KfaiF_B=KfaiF_W-KfaiF_S;% N*mm/deg
MR_BF=(KfaiF_B./KBF).^0.5/pi/tF*180;%deg/mm
% %>>>>>>>>>>>>>>>>���>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
fprintf('ǰ�� MR_F= %d  \n',MR_F)
fprintf('���� MR_R= %d  \n\n',MR_R)
fprintf('ǰ�� U-Bar MR_BF= %d deg/mm \n',MR_BF)
fprintf('���� U-Bar MR_BR= %d deg/mm \n\n',MR_BR)
fprintf('ǰ�� KfaiF= %d N mm/deg \n',KfaiF)
fprintf('���� KfaiR= %d N mm/deg \n\n',KfaiR)
fprintf('ǰ�� KfaiSF= %d N mm/deg \n',KfaiSF)
fprintf('���� KfaiSR= %d N mm/deg \n\n',KfaiSR)

fprintf('ǰ����= %d N \n',WFO*9.8);
fprintf('ǰ����= %d N \n',WFI*9.8);
fprintf('������= %d N \n',WRO*9.8);
fprintf('������= %d N \n\n',WRI*9.8);

fprintf('KWSF= %d N/mm \n',KWSF);
fprintf('KWSR= %d N/mm \n',KWSR);

fprintf('ǰ����������ṩ ���ܲ���Ǹն� KfaiF_B= %d N/mm \n',KfaiF_B);
fprintf('������������ṩ ���ܲ���Ǹն� KfaiR_B= %d N/mm \n',KfaiR_B);

% % %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% FO=1004/9.8;
% FI=391/9.8;
% RO=1159/9.8;
% RI=447/9.8;%kg
% DELT=[WFO,WFI,WRO,WRI]-[FO,FI,RO,RI];
% DELTS=['DELT_FO= %3.2d kg \n','DELT_FI= %3.2d kg \n','DELT_RO= %3.2d kg \n','DELT_RI= %3.2d kg \n'];
% fprintf('��ADAMS���\n')
% fprintf(DELTS,DELT);