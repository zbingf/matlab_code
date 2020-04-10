clear,clc
%����ն� N*mm/deg
%���� kg
%���� mm
%���ٶ� mm/s^2
%�ٶ� mm/s
%�ն� N/mm
%!!!������ģ���λƥ�䣨�ô˲��
%����ѭ����� for nn=1:1:1 Ϊ����鿴�ö�����
%>>>>>>>>>>>>>>>����MR����>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
WT_R=WT_R(2:size(WT_R,1),1);%����������������ͬ����
WT_F=WT_F(2:size(WT_F,1),1);%ǰ��������������ͬ����
length_R=length_R(2:size(length_R,1),1);%ǰ��������������ͬ����
length_F=length_F(2:size(length_F,1),1);%ǰ��������������ͬ����
t9R=t9R(2:length(t9R));
t9F=t9F(2:length(t9F));
end

%>>>>>����>>>>>>>ˮƽ·�������
R=-9125;%�뾶 -9.125
V=48.1449/3.6;%(m/s) 41.9518 
AY=V*V/R/9.8*1000;%Horizontal lateral acceleration (g)
%>>>>>��������>>>>>��λ�� ����m ����kg �ٶ�m/s ���ٶ�g��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1 
Wbcw=230;% kg ��������
Wd=68;% kg ��������
aa=0.45;%�غ�-ǰ��-����
bb=1-aa;%�غ�-����-����

tF=1180;%mm ǰ�־�
tR=1160;%mm ���־�
l=1580;%mm ���
h=300;%mm ���ĸ߶�
zRF=45;%mm �ٶ�ǰ��������45mm
zRR=60;%mm ���������60mm
hUSF=228.6;%m ǰ�������ĸ�
hUSR=228.6;%m ��������ĸ�
%>>>>>>>>>�����������>>>>>>
WUSF=20.329478;% kg ǰ�����
WUSR=20.729478;% kg �������
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
hSRD=hS-(zRF+(zRR-zRF.*(1-WSF./WTS))).*l./(l.^2+(zRR-zRF).^2).^0.5;%mm
end

%>>>>>>>>>>>>>>>ǰ��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%�����ɸնȣ���MR
KSF=78.75;% N/mm ǰ�������ɸն�
KTF=86.2789;%��̥����ն� N/mm  86.2789 10psi
KWSF=KSF.*MR_F.^2;%N/mm �����ṩ�������߸ն�
KRSF=(KWSF*KTF)./(KTF+KWSF);
KfaiSF=KRSF*tF^2/2/180*pi;%��N.mm/deg��
wF=(KRSF*1000*2/WF).^0.5/2/pi;
fprintf('ǰ������ʱƫƵ %d mm\n',wF(length(wF)/2));%
fprintf('ǰ������ʱ�����߸ն� %d mm\n',KWSF(length(wF)/2));%

%>>>>>>>>>>>>>>>����>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%�����ɸնȣ���MR
KSR=78.75;%78.75;% N/mm ���������ɸն�
KTR=86.2789;%��̥����ն� N/mm  86.2789 
KWSR=KSR.*MR_R.^2;
KRSR=(KWSR*KTR)./(KTR+KWSR);%N/mm �����ṩ�������߸ն�
KfaiSR=KRSR*tR^2/2/180*pi;%��N.mm/deg��
wR=(KRSR*1000*2/WR).^0.5/2/pi;
fprintf('��������ʱƫƵ %d mm\n',wR(length(wR)/2));%
fprintf('��������ʱ�����߸ն� %d mm\n\n',KWSR(length(wR)/2));%
%>>>>>>>>>>>>>>>>>>>ǰ��������������>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1 
length_Fwt=max(WT_F)-min(WT_F);%���г�
buchang_F=length_Fwt/length(MR_F);%����
sum_F=0;
for n=length(MR_F)/2:-1:1 %���ƻ���
    sum_F=KWSF(n)*buchang_F+sum_F;
     if sum_F<=WSF/2*9.8
         n_F=n;
         if n==1
             warning('���ɻ򳬳�������Χ������ȷ����Χ')
         end
     end
end   
S_FS=WT_F(length(MR_F)/2)-WT_F(n_F);%����������
S_FW=WF/2*9.8/KTF;%��̥������
S_F=S_FS+S_FW;
fprintf('ǰ����̥������ %d mm\n',S_F);%������ص����أ���̥������
fprintf('ǰ������ʱ����ѹ���� %d mm\n',length_F(n_F)-length_F(length(MR_F)/2));%������ص����أ���̥������
fprintf('ǰ�������������᳤ %d mm\n',length_F(n_F));%
fprintf('ǰ������ʱ���᳤ %d mm\n\n',length_F(length(MR_F)/2));%
end
%>>>>>>>>>>>>>>>>>>>����������������>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
for nn=1:1:1 
length_Rwt=max(WT_R)-min(WT_R);%���г�
buchang_R=length_Rwt/length(MR_R);%����
sum_R=0;
for n=length(MR_R)/2:-1:1 %���ƻ���
    sum_R=KWSR(n)*buchang_R+sum_R;
     if sum_R<=WSR/2*9.8
         n_R=n;
         if n==1
             warning('���ɻ򳬳�������Χ������ȷ����Χ')
         end
     end
end   
S_RS=WT_R(length(MR_R)/2)-WT_R(n_R);%����������
S_RW=WR/2*9.8/KTR;%��̥������
S_R=S_RS+S_RW;
fprintf('������̥������ %d mm\n',S_R);%������ص����أ���̥�ӵص�������
fprintf('��������ʱ����ѹ���� %d mm\n',length_R(n_R)-length_R(length(MR_R)/2));%������ص����أ���̥������
fprintf('���������������᳤ %d mm\n',length_R(n_R));%
fprintf('��������ʱ���᳤ %d mm\n\n',length_R(length(MR_R)/2));%
end
%>>>>>>>>>>>>>>>>>>>����>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBR=20000;% N*mm/deg ��U-BArŤ�˵��ɸն�
KfaiR_B=(MR_BR.*tR*pi/180).^2*KBR;
KfaiR_T=KTR*tR^2/2/180*pi;
KfaiR_S=KWSR.*tR^2/2/180*pi;
KfaiR_W=KfaiR_B+KfaiR_S;%���ܲ���ն�
KfaiR=(KfaiR_T.*KfaiR_W)./(KfaiR_T+KfaiR_W);
KfaiR_W(50),KfaiR(50)
% KfaiR=KfaiBR+KfaiSR;
% KfaiR(n_R:length(KfaiR)/2);
%>>>>>>>>>>>>>>>>>>>>>ǰ��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
KBF=4420;% N*mm/deg ǰU-BArŤ�˵��ɸն�
KfaiBF=KBF.*(MR_BF*pi*tF/180).^2;
KfaiF_T=KTF*tF^2/2/180*pi;
KfaiF_W=KfaiBF+KWSF.*tF^2/2/180*pi;%���ܲ���ն�
KfaiF=(KfaiF_T.*KfaiF_W)./(KfaiF_T+KfaiF_W);
KfaiF(50)
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>ͼ��>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% subplot(211)
% hold on,grid on;
% xlabel('���� /mm ');ylabel('�����߸ն� /mm ')
% plot(WT_F,KWSF,'r',WT_R,KWSR,'b')
% legend('ǰ��','����')
% subplot(212)
% hold on,grid on;
% xlabel('���� /mm ');ylabel('��Ч���ܸն� /mm ')
% plot(WT_F,KRSF,'r',WT_R,KRSR,'b')
% legend('ǰ��','����')

% %>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% load('G:\MATLAB\Car\GUI\database\CRT\ADAMS_S.mat')
% load('G:\MATLAB\Car\GUI\database\CRT\ADAMS_T.mat')
% load('G:\MATLAB\Car\GUI\database\CRT\ADAMS_W.mat')
% subplot(121)
% plot(ADAMS_W,ADAMS_S,'r',WT_F,KfaiF_W,'b')
% subplot(122)
% plot(ADAMS_W,ADAMS_T,'r',WT_F,KfaiF,'b')
% /9.8/1000*180/pi
