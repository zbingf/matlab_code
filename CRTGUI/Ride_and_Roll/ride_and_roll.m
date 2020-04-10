function varargout = ride_and_roll(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ride_and_roll_OpeningFcn, ...
                   'gui_OutputFcn',  @ride_and_roll_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

function ride_and_roll_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = ride_and_roll_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function output_r_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile({'*.xlsx';'*.xls'},'Choose a File');
dizhi=[pathname filename];
if get(hObject,'Value')
    Wbcw=str2double(get(handles.Wbcw,'string'));Wd=str2double(get(handles.Wd,'string'));
    aa=str2double(get(handles.aa,'string'));tF=str2double(get(handles.tF,'string'));
    tR=str2double(get(handles.tR,'string'));l=str2double(get(handles.l,'string'));
    h=str2double(get(handles.h,'string'));zRF=str2double(get(handles.zRF,'string'));
    zRR=str2double(get(handles.zRR,'string'));hUSF=str2double(get(handles.hUSF,'string'));
    hUSR=str2double(get(handles.hUSR,'string'));WUSF=str2double(get(handles.WUSF,'string'));
    WUSR=str2double(get(handles.WUSR,'string'));R=str2double(get(handles.R,'string'));
    V=str2double(get(handles.V,'string'));wF=str2double(get(handles.wF,'string'));
    KSF=str2double(get(handles.KSF,'string'));KTF=str2double(get(handles.KTF,'string'));
    KBF=str2double(get(handles.KBF,'string'));wR=str2double(get(handles.wR,'string'));
    KSR=str2double(get(handles.KSR,'string'));KTR=str2double(get(handles.KTR,'string'));
    KBR=str2double(get(handles.KBR,'string'));RG=str2double(get(handles.RG,'string'));
    a=str2double(get(handles.a,'string'));
    AA=[
        Wbcw,Wd,aa,tF,tR,l,h,zRF,zRR,hUSF,hUSR,WUSF,WUSR,...
        R,V,wF,KSF,KTF,KBF,wR,KSR,KTR,KBR,RG,a,...
        ]';
    xlswrite(dizhi,AA,'C2:C26');
    
end


function input_r_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile({'*.xlsx';'*.xls'},'Choose a File');
dizhi=[pathname filename];
if get(hObject,'Value')
    AA=xlsread(dizhi,'C2:C26');AA=AA';
    [
        Wbcw,Wd,aa,tF,tR,l,h,zRF,zRR,hUSF,hUSR,WUSF,WUSR,...
        R,V,wF,KSF,KTF,KBF,wR,KSR,KTR,KBR,RG,a,...
     ]=deal(AA(1),AA(2),AA(3),AA(4),AA(5),AA(6),AA(7),AA(8),...
     AA(9),AA(10),AA(11),AA(12),AA(13),AA(14),AA(15),AA(16),AA(17),AA(18),AA(19),...
     AA(20),AA(21),AA(22),AA(23),AA(24),AA(25));
   
    set(handles.Wbcw,'String',Wbcw);set(handles.Wd,'string',Wd);set(handles.aa,'string',aa);
    set(handles.tF,'string',tF);set(handles.tR,'string',tR);set(handles.l,'string',l);
    set(handles.h,'string',h);set(handles.zRF,'string',zRF);set(handles.zRR,'string',zRR);
    set(handles.hUSF,'string',hUSF);set(handles.hUSR,'string',hUSR);set(handles.WUSF,'string',WUSF);
    set(handles.WUSR,'string',WUSR);set(handles.R,'string',R);set(handles.V,'string',V);    
    set(handles.wF,'string',wF);set(handles.KSF,'string',KSF);set(handles.KTF,'string',KTF);
    set(handles.wR,'string',wR);set(handles.KSR,'string',KSR);set(handles.KTR,'string',KTR);
    set(handles.KBF,'string',KBF);set(handles.KBR,'string',KBR);
    set(handles.RG,'string',RG);set(handles.a,'string',a);
end

function run_r_Callback(hObject, eventdata, handles)
run('GUI_ride_and_roll_main.m');
