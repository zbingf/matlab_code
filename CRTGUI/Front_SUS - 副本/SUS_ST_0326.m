function varargout = SUS_ST_0326(varargin)
% SUS_ST_0326 MATLAB code for SUS_ST_0326.fig
%      SUS_ST_0326, by itself, creates a new SUS_ST_0326 or raises the existing
%      singleton*.
%
%      H = SUS_ST_0326 returns the handle to a new SUS_ST_0326 or the handle to
%      the existing singleton*.
%
%      SUS_ST_0326('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUS_ST_0326.M with the given input arguments.
%
%      SUS_ST_0326('Property','Value',...) creates a new SUS_ST_0326 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SUS_ST_0326_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SUS_ST_0326_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SUS_ST_0326

% Last Modified by GUIDE v2.5 12-Apr-2015 17:13:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SUS_ST_0326_OpeningFcn, ...
                   'gui_OutputFcn',  @SUS_ST_0326_OutputFcn, ...
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


% --- Executes just before SUS_ST_0326 is made visible.
function SUS_ST_0326_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SUS_ST_0326 (see VARARGIN)
set(handles.pushbutton1,'Value',0)
set(handles.pushbutton2,'Value',0)
set(handles.pushbutton3,'Value',0)
set(handles.pushbutton4,'Value',0)

% Choose default command line output for SUS_ST_0326
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SUS_ST_0326 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SUS_ST_0326_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N 
if get(hObject,'Value')
    cla(handles.axes1,'reset'); 
    cla(handles.axes2,'reset');
    cla(handles.axes3,'reset'); 
    cla(handles.axes4,'reset'); 
    N=0;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global LT ST Y1 Y4 Z X9 Y9 Z9 x4 y4 z4 IN CA H SR T4 Z3 Z2 T5 T6 a1 b1 a2 b2 h sr l4 l5 z3 z2 t4 t5 M LL1 r a Z11
global N

N=N+1;
run('SUS_ST_GUI_0326.m')
if N>6
    N=1;
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile({'*.xls';'*.xlsx'},'Choose a File');
dizhi=[pathname filename];
if get(hObject,'Value')
    H=str2double(get(handles.H,'string'));SR=str2double(get(handles.SR,'string'));T4=str2double(get(handles.T4,'string'));Z3=str2double(get(handles.Z3,'string'));
    Z2=str2double(get(handles.Z2,'string'));Y1=str2double(get(handles.Y1,'string'));Y4=str2double(get(handles.Y4,'string'));
    
    T5=str2double(get(handles.T5,'string'));T6=str2double(get(handles.T6,'string'));
    a1=str2double(get(handles.a1,'string'));b1=str2double(get(handles.b1,'string'));
    a2=str2double(get(handles.a2,'string'));b2=str2double(get(handles.b2,'string'));
    
    l2=str2double(get(handles.l2,'string'));l4=str2double(get(handles.l4,'string'));l5=str2double(get(handles.l5,'string'));
    t2=str2double(get(handles.t2,'string'));t4=str2double(get(handles.t4,'string'));t5=str2double(get(handles.t5,'string'));
    
    M=str2double(get(handles.M,'string'));LL1=str2double(get(handles.LL1,'string'));
    r=str2double(get(handles.r,'string'));a=str2double(get(handles.a,'string'));
    Z11=str2double(get(handles.Z11,'string'));Z12=str2double(get(handles.Z12,'string'));
    
    X9=str2double(get(handles.X9,'string'));Y9=str2double(get(handles.Y9,'string'));Z9=str2double(get(handles.Z9,'string'));
    x6=str2double(get(handles.x6,'string'));y6=str2double(get(handles.y6,'string'));z6=str2double(get(handles.z6,'string'));
    x4=str2double(get(handles.x4,'string'));y4=str2double(get(handles.y4,'string'));z4=str2double(get(handles.z4,'string'));

    IN=str2double(get(handles.IN,'string'));CA=str2double(get(handles.CA,'string'));
    toe=str2double(get(handles.toe,'string'));camber=str2double(get(handles.camber,'string'));
    L=str2double(get(handles.L,'string'));
    
    AA=[H, SR, T4, Z3, Z2, Y1, Y4, ...
     T5, T6, a1, b1, a2, b2, ...
     l2, l4, l5, t2, t4, t5, ...
     M, LL1, r, a, Z11,Z12,...
     X9, Y9, Z9, x6, y6, z6, x4, y4, z4,...
     IN, CA, toe, camber, L]';
    xlswrite(dizhi,AA,'sheet1','B1:B39');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile({'*.xls';'*.xlsx'},'Choose a File');
dizhi=[pathname filename];
if get(hObject,'Value')
    AA=xlsread(dizhi,'sheet1','B1:B39');AA=AA';
    [H, SR, T4, Z3, Z2, Y1, Y4, ...
     T5, T6, a1, b1, a2, b2, ...
     l2, l4, l5, t2, t4, t5, ...
     M, LL1, r, a, Z11,Z12,...
     X9, Y9, Z9, x6, y6, z6, x4, y4, z4,...
     IN, CA, toe, camber, L]=deal(AA(1),AA(2),AA(3),AA(4),AA(5),AA(6),AA(7),AA(8),...
     AA(9),AA(10),AA(11),AA(12),AA(13),AA(14),AA(15),AA(16),AA(17),AA(18),AA(19),...
     AA(20),AA(21),AA(22),AA(23),AA(24),AA(25),AA(26),AA(27),AA(28),AA(29),AA(30),...
     AA(31),AA(32),AA(33),AA(34),AA(35),AA(36),AA(37),AA(38),AA(39));
    
    set(handles.H,'String',H);set(handles.SR,'string',SR);set(handles.T4,'string',T4);set(handles.Z3,'string',Z3);
    set(handles.Z2,'string',Z2); set(handles.Y1,'string',Y1); set(handles.Y4,'string',Y4);
       
    set(handles.T5,'string',T5);set(handles.T6,'string',T6);set(handles.a1,'string',a1);
    set(handles.b1,'string',b1);set(handles.a2,'string',a2);set(handles.b2,'string',b2);
    
    set(handles.l2,'string',l2);set(handles.l4,'string',l4);set(handles.l5,'string',l5);
    set(handles.t2,'string',t2);set(handles.t4,'string',t4);set(handles.t5,'string',t5);    
    
    set(handles.M,'string',M);set(handles.LL1,'string',LL1);set(handles.r,'string',r);set(handles.a,'string',a);set(handles.Z11,'string',Z11);
    set(handles.Z12,'string',Z12);
    set(handles.X9,'string',X9);set(handles.Y9,'string',Y9);set(handles.Z9,'string',Z9);
    set(handles.x6,'string',x6);set(handles.y6,'string',y6);set(handles.z6,'string',z6);
    set(handles.x4,'string',x4);set(handles.y4,'string',y4);set(handles.z4,'string',z4);
    
    set(handles.IN,'string',IN);set(handles.CA,'string',CA);set(handles.toe,'string',toe);set(handles.camber,'string',camber);
    set(handles.L,'string',L);
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
    set(handles.text68,'Visible','on');
    set(handles.Z12,'Visible','on');
else
    set(handles.text68,'Visible','off');
    set(handles.Z12,'Visible','off');   
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton5



function Z12_Callback(hObject, eventdata, handles)
% hObject    handle to Z12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z12 as text
%        str2double(get(hObject,'String')) returns contents of Z12 as a double


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
