function varargout = ttttt(varargin)
% TTTTT MATLAB code for ttttt.fig
%      TTTTT, by itself, creates a new TTTTT or raises the existing
%      singleton*.
%
%      H = TTTTT returns the handle to a new TTTTT or the handle to
%      the existing singleton*.
%
%      TTTTT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TTTTT.M with the given input arguments.
%
%      TTTTT('Property','Value',...) creates a new TTTTT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ttttt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ttttt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ttttt

% Last Modified by GUIDE v2.5 28-Mar-2015 14:27:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ttttt_OpeningFcn, ...
                   'gui_OutputFcn',  @ttttt_OutputFcn, ...
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


% --- Executes just before ttttt is made visible.

function ttttt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ttttt (see VARARGIN)

% Choose default command line output for ttttt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ttttt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ttttt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function PEX1_Callback(hObject, eventdata, handles)
% hObject    handle to PEX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEX1 as text
%        str2double(get(hObject,'String')) returns contents of PEX1 as a double


% --- Executes during object creation, after setting all properties.
function PEX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEX2_Callback(hObject, eventdata, handles)
% hObject    handle to PEX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEX2 as text
%        str2double(get(hObject,'String')) returns contents of PEX2 as a double


% --- Executes during object creation, after setting all properties.
function PEX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEX3_Callback(hObject, eventdata, handles)
% hObject    handle to PEX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEX3 as text
%        str2double(get(hObject,'String')) returns contents of PEX3 as a double


% --- Executes during object creation, after setting all properties.
function PEX3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEX4_Callback(hObject, eventdata, handles)
% hObject    handle to PEX4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEX4 as text
%        str2double(get(hObject,'String')) returns contents of PEX4 as a double


% --- Executes during object creation, after setting all properties.
function PEX4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEX4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function PCX1_Callback(hObject, eventdata, handles)
% hObject    handle to PCX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCX1 as text
%        str2double(get(hObject,'String')) returns contents of PCX1 as a double


% --- Executes during object creation, after setting all properties.
function PCX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PCX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PDX1_Callback(hObject, eventdata, handles)
% hObject    handle to PDX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDX1 as text
%        str2double(get(hObject,'String')) returns contents of PDX1 as a double


% --- Executes during object creation, after setting all properties.
function PDX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PDX2_Callback(hObject, eventdata, handles)
% hObject    handle to PDX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDX2 as text
%        str2double(get(hObject,'String')) returns contents of PDX2 as a double


% --- Executes during object creation, after setting all properties.
function PDX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PDX3_Callback(hObject, eventdata, handles)
% hObject    handle to PDX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDX3 as text
%        str2double(get(hObject,'String')) returns contents of PDX3 as a double


% --- Executes during object creation, after setting all properties.
function PDX3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKX1_Callback(hObject, eventdata, handles)
% hObject    handle to PKX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKX1 as text
%        str2double(get(hObject,'String')) returns contents of PKX1 as a double


% --- Executes during object creation, after setting all properties.
function PKX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKX2_Callback(hObject, eventdata, handles)
% hObject    handle to PKX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKX2 as text
%        str2double(get(hObject,'String')) returns contents of PKX2 as a double


% --- Executes during object creation, after setting all properties.
function PKX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKX3_Callback(hObject, eventdata, handles)
% hObject    handle to PKX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKX3 as text
%        str2double(get(hObject,'String')) returns contents of PKX3 as a double


% --- Executes during object creation, after setting all properties.
function PKX3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKX3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PHX1_Callback(hObject, eventdata, handles)
% hObject    handle to PHX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PHX1 as text
%        str2double(get(hObject,'String')) returns contents of PHX1 as a double


% --- Executes during object creation, after setting all properties.
function PHX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PHX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PHX2_Callback(hObject, eventdata, handles)
% hObject    handle to PHX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PHX2 as text
%        str2double(get(hObject,'String')) returns contents of PHX2 as a double


% --- Executes during object creation, after setting all properties.
function PHX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PHX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PVX1_Callback(hObject, eventdata, handles)
% hObject    handle to PVX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVX1 as text
%        str2double(get(hObject,'String')) returns contents of PVX1 as a double


% --- Executes during object creation, after setting all properties.
function PVX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PVX2_Callback(hObject, eventdata, handles)
% hObject    handle to PVX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVX2 as text
%        str2double(get(hObject,'String')) returns contents of PVX2 as a double


% --- Executes during object creation, after setting all properties.
function PVX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RBX1_Callback(hObject, eventdata, handles)
% hObject    handle to RBX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBX1 as text
%        str2double(get(hObject,'String')) returns contents of RBX1 as a double


% --- Executes during object creation, after setting all properties.
function RBX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RBX2_Callback(hObject, eventdata, handles)
% hObject    handle to RBX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBX2 as text
%        str2double(get(hObject,'String')) returns contents of RBX2 as a double


% --- Executes during object creation, after setting all properties.
function RBX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RCX1_Callback(hObject, eventdata, handles)
% hObject    handle to RCX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RCX1 as text
%        str2double(get(hObject,'String')) returns contents of RCX1 as a double


% --- Executes during object creation, after setting all properties.
function RCX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RCX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function REX1_Callback(hObject, eventdata, handles)
% hObject    handle to REX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of REX1 as text
%        str2double(get(hObject,'String')) returns contents of REX1 as a double


% --- Executes during object creation, after setting all properties.
function REX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function REX2_Callback(hObject, eventdata, handles)
% hObject    handle to REX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of REX2 as text
%        str2double(get(hObject,'String')) returns contents of REX2 as a double


% --- Executes during object creation, after setting all properties.
function REX2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REX2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RHX1_Callback(hObject, eventdata, handles)
% hObject    handle to RHX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RHX1 as text
%        str2double(get(hObject,'String')) returns contents of RHX1 as a double


% --- Executes during object creation, after setting all properties.
function RHX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RHX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)global PEX4 PEX3
global ALPHA FZ GAMMA k
global FZ0 FX DFZ KX
global PCX1 ...
       PDX1   PDX2   PDX3  ...
       PEX1   PEX2  PEX3   PEX4   ...
       PKX1   PKX2   PKX3  ...
       PHX1   PHX2   ...
       PVX1   PVX2  ... 
       RBX1   RBX2 ...
       RCX1   ...    
       REX1   REX2   ...
       RHX1     
if get(hObject,'Value')
    %参数
    PEX1=str2double(get(handles.PEX1,'string'));PEX2=str2double(get(handles.PEX2,'string'));PEX3=str2double(get(handles.PEX3,'string'));PEX4=str2double(get(handles.PEX4,'string'));
    PCX1=str2double(get(handles.PCX1,'string'));
    PDX1=str2double(get(handles.PDX1,'string'));PDX2=str2double(get(handles.PDX2,'string'));PDX3=str2double(get(handles.PDX3,'string'));
    PKX1=str2double(get(handles.PKX1,'string'));PKX2=str2double(get(handles.PKX2,'string'));PKX3=str2double(get(handles.PKX3,'string'));
    PHX1=str2double(get(handles.PHX1,'string'));PHX2=str2double(get(handles.PHX2,'string'));
    PVX1=str2double(get(handles.PVX1,'string'));PVX2=str2double(get(handles.PVX2,'string'));
    RBX1=str2double(get(handles.RBX1,'string'));RBX2=str2double(get(handles.RBX2,'string'));
    RCX1=str2double(get(handles.RCX1,'string'));
    REX1=str2double(get(handles.REX1,'string'));REX2=str2double(get(handles.REX2,'string'));
    RHX1=str2double(get(handles.RHX1,'string'));
    FZ0=str2double(get(handles.FZ0,'string'));
    %变量
    ALPHA =(str2double(get(handles.ALPHA,'string')))*pi/180;
 
    FZ=str2double(get(handles.FZ,'string'));   
    GAMMA =(str2double(get(handles. GAMMA,'string')))*pi/180;   
    k=str2double(get(handles.k,'string'));
    %公式
    DFZ    = (FZ-FZ0) ./ FZ0;
    SHX     = (PHX1+PHX2 .* DFZ) ;
    kx      =k+SHX;
    CX      = PCX1 ; 
    MUX     = (PDX1+PDX2 .* DFZ) .* (1.0-PDX3 .* GAMMA.^2) ;
    DX      = MUX .* FZ; 
    KX      = FZ.*(PKX1+PKX2.*DFZ).*exp(PKX3.*DFZ);
    BX      = KX ./ (CX .* DX); 
    EX      = (PEX1+PEX2 .* DFZ+PEX3.*DFZ.*DFZ) .* (1-(PEX4.* sign(kx))); 
    SVX     = FZ.* (PVX1+PVX2.* DFZ); 
    FX0      = DX.* sin(CX.* atan(BX.* kx-EX.* (BX.* kx-atan(BX.* kx))))+SVX; 
    SHxa=RHX1;
    Cxa=RCX1;
    aerfas=ALPHA+SHxa;
    Bxa=RBX1*cos(atan(k.*RBX2));
    Exa=REX1+REX2*DFZ;
    Gxa=cos(atan(aerfas.*Bxa-(aerfas.*Bxa-atan(aerfas.*Bxa)).*Exa).*Cxa)./cos(atan(Bxa.*SHxa-(Bxa.*SHxa-atan(Bxa.*SHxa).*Exa)).*Cxa);
    FX=FX0.*Gxa;
    set(handles.FX,'string',FX)
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')
%longitudinal
A=xlsread('G:\MATLAB\Car\GUI\tire\run32_12psi_LCO10','B5:B25');
A=A';
FZ0=xlsread('G:\MATLAB\Car\GUI\tire\run32_12psi_LCO10','Sheet1','K5');
set(handles.FZ0,'string',FZ0);
PEX1=A(1); PEX2=A(2);PEX3=A(3);PEX4=A(4);
PCX1=A(5);
PDX1=A(6);PDX2=A(7);PDX3=A(8);
PKX1=A(9);PKX2=A(10);PKX3=A(11);
PHX1=A(12);PHX2=A(13);
PVX1=A(14);PVX2=A(15);
RBX1=A(16);  RBX2=A(17);         
RCX1=A(18);         
REX1=A(19);REX2=A(20);        
RHX1=A(21);
set(handles.PEX1,'string',PEX1);set(handles.PEX2,'string',PEX2);set(handles.PEX3,'string',PEX3);set(handles.PEX4,'string',PEX4);
set(handles.PCX1,'string',PCX1);
set(handles.PDX1,'string',PDX1);set(handles.PDX2,'string',PDX2);set(handles.PDX3,'string',PDX3);
set(handles.PKX1,'string',PKX1);set(handles.PKX2,'string',PKX2);set(handles.PKX3,'string',PKX3);
set(handles.PHX1,'string',PHX1);set(handles.PHX2,'string',PHX2);
set(handles.PVX1,'string',PVX1);set(handles.PVX2,'string',PVX2);
set(handles.RBX1,'string',RBX1);set(handles.RBX2,'string',RBX2);
set(handles.RCX1,'string',RCX1);
set(handles.REX1,'string',REX1);set(handles.REX2,'string',REX2);
set(handles.RHX1,'string',RHX1);
%lateral
B=xlsread('G:\MATLAB\Car\GUI\tire\run32_12psi_LCO10','Sheet1','E5:E36');
B=B';
PKY4=B(1); 
PCY1=B(2);
PDY1=B(3);PDY2=B(4);PDY3=B(5);
PEY1=B(6);PEY2=B(7);PEY3=B(8);PEY4=B(9);
PKY1=B(10);PKY2=B(11);PKY3=B(12);PKY5=B(13);PKY6=B(14);
PHY1=B(15);PHY2=B(16);
PVY1=B(17);PVY2=B(18);
RBY1=B(19);RBY2=B(20);RBY3=B(21);     
RCY1=B(22);         
REY1=B(23);REY2=B(24);        
RHY1=B(25);RHY2=B(26);
RVY1=B(27);RVY2=B(28);RVY3=B(29);RVY4=B(30);RVY5=B(31);RVY6=B(32);
set(handles.PKY4,'string',PKY4);
set(handles.PCY1,'string',PCY1);
set(handles.PDY1,'string',PDY1);set(handles.PDY2,'string',PDY2);set(handles.PDY3,'string',PDY3);
set(handles.PEY1,'string',PEY1);set(handles.PEY2,'string',PEY2);set(handles.PEY3,'string',PEY3);set(handles.PEY4,'string',PEY4);
set(handles.PKY1,'string',PKY1);set(handles.PKY2,'string',PKY2);set(handles.PKY3,'string',PKY3);set(handles.PKY5,'string',PKY5);set(handles.PKY6,'string',PKY6);
set(handles.PHY1,'string',PHY1);set(handles.PHY2,'string',PHY2);
set(handles.PVY1,'string',PVY1);set(handles.PVY2,'string',PVY2);
set(handles.RBY1,'string',RBY1);set(handles.RBY2,'string',RBY2);set(handles.RBY3,'string',RBY3);
set(handles.RCY1,'string',RCY1);
set(handles.REY1,'string',REY1);set(handles.REY2,'string',REY2);
set(handles.RHY1,'string',RHY1);set(handles.RHY2,'string',RHY2);
set(handles.RVY1,'string',RVY1);set(handles.RVY2,'string',RVY2);set(handles.RVY3,'string',RVY3);set(handles.RVY4,'string',RVY4);set(handles.RVY5,'string',RVY5);set(handles.RVY6,'string',RVY6);
%回正
C=xlsread('G:\MATLAB\Car\GUI\tire\run32_12psi_LCO10','Sheet1','H5:H26');
C=C';
QEZ1=C(1);QEZ2=C(2);QEZ4=C(3);
QBZ1=C(4);QBZ2=C(5);QBZ4=C(6);QBZ5=C(7);
QCZ1=C(8);
QDZ1=C(9);QDZ2=C(10);QDZ6=C(11);QDZ7=C(12);QDZ8=C(13);QDZ9=C(14);
QHZ1=C(15);QHZ2=C(16);QHZ3=C(17);QHZ4=C(18);
SSZ1=C(19);SSZ2=C(20);SSZ3=C(21);SSZ4=C(22);
set(handles.QEZ1,'string',QEZ1);set(handles.QEZ2,'string',QEZ2);set(handles.QEZ4,'string',QEZ4);
set(handles.QBZ1,'string',QBZ1);set(handles.QBZ2,'string',QBZ2);set(handles.QBZ4,'string',QBZ4);set(handles.QBZ5,'string',QBZ5);
set(handles.QCZ1,'string',QCZ1);
set(handles.QDZ1,'string',QDZ1);set(handles.QDZ2,'string',QDZ2);set(handles.QDZ6,'string',QDZ6);set(handles.QDZ7,'string',QDZ7);set(handles.QDZ8,'string',QDZ8);set(handles.QDZ9,'string',QDZ9);
set(handles.QHZ1,'string',QHZ1);set(handles.QHZ2,'string',QHZ2);set(handles.QHZ3,'string',QHZ3);set(handles.QHZ4,'string',QHZ4);
set(handles.SSZ1,'string',SSZ1);set(handles.SSZ2,'string',SSZ2);set(handles.SSZ3,'string',SSZ3);set(handles.SSZ4,'string',SSZ4);
end



function ALPHA_Callback(hObject, eventdata, handles)
% hObject    handle to ALPHA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ALPHA as text
%        str2double(get(hObject,'String')) returns contents of ALPHA as a double


% --- Executes during object creation, after setting all properties.
function ALPHA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ALPHA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GAMMA_Callback(hObject, eventdata, handles)
% hObject    handle to GAMMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GAMMA as text
%        str2double(get(hObject,'String')) returns contents of GAMMA as a double


% --- Executes during object creation, after setting all properties.
function GAMMA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GAMMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function FZ_Callback(hObject, eventdata, handles)
% hObject    handle to FZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FZ as text
%        str2double(get(hObject,'String')) returns contents of FZ as a double


% --- Executes during object creation, after setting all properties.
function FZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FX_Callback(hObject, eventdata, handles)
% hObject    handle to FX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FX as text
%        str2double(get(hObject,'String')) returns contents of FX as a double


% --- Executes during object creation, after setting all properties.
function FX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FZ0_Callback(hObject, eventdata, handles)
% hObject    handle to FZ0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FZ0 as text
%        str2double(get(hObject,'String')) returns contents of FZ0 as a double


% --- Executes during object creation, after setting all properties.
function FZ0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FZ0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function PKY4_Callback(hObject, eventdata, handles)
% hObject    handle to PKY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY4 as text
%        str2double(get(hObject,'String')) returns contents of PKY4 as a double


% --- Executes during object creation, after setting all properties.
function PKY4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PCY1_Callback(hObject, eventdata, handles)
% hObject    handle to PCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCY1 as text
%        str2double(get(hObject,'String')) returns contents of PCY1 as a double


% --- Executes during object creation, after setting all properties.
function PCY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PDY1_Callback(hObject, eventdata, handles)
% hObject    handle to PDY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDY1 as text
%        str2double(get(hObject,'String')) returns contents of PDY1 as a double


% --- Executes during object creation, after setting all properties.
function PDY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PDY2_Callback(hObject, eventdata, handles)
% hObject    handle to PDY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDY2 as text
%        str2double(get(hObject,'String')) returns contents of PDY2 as a double


% --- Executes during object creation, after setting all properties.
function PDY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PDY3_Callback(hObject, eventdata, handles)
% hObject    handle to PDY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDY3 as text
%        str2double(get(hObject,'String')) returns contents of PDY3 as a double


% --- Executes during object creation, after setting all properties.
function PDY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEY1_Callback(hObject, eventdata, handles)
% hObject    handle to PEY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY1 as text
%        str2double(get(hObject,'String')) returns contents of PEY1 as a double


% --- Executes during object creation, after setting all properties.
function PEY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEY2_Callback(hObject, eventdata, handles)
% hObject    handle to PEY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY2 as text
%        str2double(get(hObject,'String')) returns contents of PEY2 as a double


% --- Executes during object creation, after setting all properties.
function PEY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEY3_Callback(hObject, eventdata, handles)
% hObject    handle to PEY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY3 as text
%        str2double(get(hObject,'String')) returns contents of PEY3 as a double


% --- Executes during object creation, after setting all properties.
function PEY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PEY4_Callback(hObject, eventdata, handles)
% hObject    handle to PEY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY4 as text
%        str2double(get(hObject,'String')) returns contents of PEY4 as a double


% --- Executes during object creation, after setting all properties.
function PEY4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKY1_Callback(hObject, eventdata, handles)
% hObject    handle to PKY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY1 as text
%        str2double(get(hObject,'String')) returns contents of PKY1 as a double


% --- Executes during object creation, after setting all properties.
function PKY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKY2_Callback(hObject, eventdata, handles)
% hObject    handle to PKY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY2 as text
%        str2double(get(hObject,'String')) returns contents of PKY2 as a double


% --- Executes during object creation, after setting all properties.
function PKY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKY3_Callback(hObject, eventdata, handles)
% hObject    handle to PKY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY3 as text
%        str2double(get(hObject,'String')) returns contents of PKY3 as a double


% --- Executes during object creation, after setting all properties.
function PKY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKY5_Callback(hObject, eventdata, handles)
% hObject    handle to PKY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY5 as text
%        str2double(get(hObject,'String')) returns contents of PKY5 as a double


% --- Executes during object creation, after setting all properties.
function PKY5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PKY6_Callback(hObject, eventdata, handles)
% hObject    handle to PKY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY6 as text
%        str2double(get(hObject,'String')) returns contents of PKY6 as a double


% --- Executes during object creation, after setting all properties.
function PKY6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PHY1_Callback(hObject, eventdata, handles)
% hObject    handle to PHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PHY1 as text
%        str2double(get(hObject,'String')) returns contents of PHY1 as a double


% --- Executes during object creation, after setting all properties.
function PHY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PHY2_Callback(hObject, eventdata, handles)
% hObject    handle to PHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PHY2 as text
%        str2double(get(hObject,'String')) returns contents of PHY2 as a double


% --- Executes during object creation, after setting all properties.
function PHY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit61_Callback(hObject, eventdata, handles)
% hObject    handle to PKY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY4 as text
%        str2double(get(hObject,'String')) returns contents of PKY4 as a double


% --- Executes during object creation, after setting all properties.
function edit61_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit62_Callback(hObject, eventdata, handles)
% hObject    handle to PCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCY1 as text
%        str2double(get(hObject,'String')) returns contents of PCY1 as a double


% --- Executes during object creation, after setting all properties.
function edit62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit63_Callback(hObject, eventdata, handles)
% hObject    handle to PDY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDY1 as text
%        str2double(get(hObject,'String')) returns contents of PDY1 as a double


% --- Executes during object creation, after setting all properties.
function edit63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit64_Callback(hObject, eventdata, handles)
% hObject    handle to PDY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDY2 as text
%        str2double(get(hObject,'String')) returns contents of PDY2 as a double


% --- Executes during object creation, after setting all properties.
function edit64_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit65_Callback(hObject, eventdata, handles)
% hObject    handle to PDY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PDY3 as text
%        str2double(get(hObject,'String')) returns contents of PDY3 as a double


% --- Executes during object creation, after setting all properties.
function edit65_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PDY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit66_Callback(hObject, eventdata, handles)
% hObject    handle to PEY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY1 as text
%        str2double(get(hObject,'String')) returns contents of PEY1 as a double


% --- Executes during object creation, after setting all properties.
function edit66_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit67_Callback(hObject, eventdata, handles)
% hObject    handle to PEY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY2 as text
%        str2double(get(hObject,'String')) returns contents of PEY2 as a double


% --- Executes during object creation, after setting all properties.
function edit67_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit68_Callback(hObject, eventdata, handles)
% hObject    handle to PEY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY3 as text
%        str2double(get(hObject,'String')) returns contents of PEY3 as a double


% --- Executes during object creation, after setting all properties.
function edit68_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit69_Callback(hObject, eventdata, handles)
% hObject    handle to PEY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PEY4 as text
%        str2double(get(hObject,'String')) returns contents of PEY4 as a double


% --- Executes during object creation, after setting all properties.
function edit69_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit70_Callback(hObject, eventdata, handles)
% hObject    handle to PKY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY1 as text
%        str2double(get(hObject,'String')) returns contents of PKY1 as a double


% --- Executes during object creation, after setting all properties.
function edit70_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit71_Callback(hObject, eventdata, handles)
% hObject    handle to PKY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY2 as text
%        str2double(get(hObject,'String')) returns contents of PKY2 as a double


% --- Executes during object creation, after setting all properties.
function edit71_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit72_Callback(hObject, eventdata, handles)
% hObject    handle to PKY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY3 as text
%        str2double(get(hObject,'String')) returns contents of PKY3 as a double


% --- Executes during object creation, after setting all properties.
function edit72_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit73_Callback(hObject, eventdata, handles)
% hObject    handle to PKY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY5 as text
%        str2double(get(hObject,'String')) returns contents of PKY5 as a double


% --- Executes during object creation, after setting all properties.
function edit73_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit74_Callback(hObject, eventdata, handles)
% hObject    handle to PKY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PKY6 as text
%        str2double(get(hObject,'String')) returns contents of PKY6 as a double


% --- Executes during object creation, after setting all properties.
function edit74_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PKY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit75_Callback(hObject, eventdata, handles)
% hObject    handle to PHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PHY1 as text
%        str2double(get(hObject,'String')) returns contents of PHY1 as a double


% --- Executes during object creation, after setting all properties.
function edit75_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit76_Callback(hObject, eventdata, handles)
% hObject    handle to PHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PHY2 as text
%        str2double(get(hObject,'String')) returns contents of PHY2 as a double


% --- Executes during object creation, after setting all properties.
function edit76_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit77_Callback(hObject, eventdata, handles)
% hObject    handle to PVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVY1 as text
%        str2double(get(hObject,'String')) returns contents of PVY1 as a double


% --- Executes during object creation, after setting all properties.
function edit77_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit78_Callback(hObject, eventdata, handles)
% hObject    handle to PVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVY2 as text
%        str2double(get(hObject,'String')) returns contents of PVY2 as a double


% --- Executes during object creation, after setting all properties.
function edit78_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit79_Callback(hObject, eventdata, handles)
% hObject    handle to RBY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBY1 as text
%        str2double(get(hObject,'String')) returns contents of RBY1 as a double


% --- Executes during object creation, after setting all properties.
function edit79_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit80_Callback(hObject, eventdata, handles)
% hObject    handle to RBY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBY2 as text
%        str2double(get(hObject,'String')) returns contents of RBY2 as a double


% --- Executes during object creation, after setting all properties.
function edit80_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit81_Callback(hObject, eventdata, handles)
% hObject    handle to RBY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBY3 as text
%        str2double(get(hObject,'String')) returns contents of RBY3 as a double


% --- Executes during object creation, after setting all properties.
function edit81_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit82_Callback(hObject, eventdata, handles)
% hObject    handle to RCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RCY1 as text
%        str2double(get(hObject,'String')) returns contents of RCY1 as a double


% --- Executes during object creation, after setting all properties.
function edit82_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit83_Callback(hObject, eventdata, handles)
% hObject    handle to REY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of REY1 as text
%        str2double(get(hObject,'String')) returns contents of REY1 as a double


% --- Executes during object creation, after setting all properties.
function edit83_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit84_Callback(hObject, eventdata, handles)
% hObject    handle to REY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of REY2 as text
%        str2double(get(hObject,'String')) returns contents of REY2 as a double


% --- Executes during object creation, after setting all properties.
function edit84_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit85_Callback(hObject, eventdata, handles)
% hObject    handle to RHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RHY1 as text
%        str2double(get(hObject,'String')) returns contents of RHY1 as a double


% --- Executes during object creation, after setting all properties.
function edit85_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit86_Callback(hObject, eventdata, handles)
% hObject    handle to RHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RHY2 as text
%        str2double(get(hObject,'String')) returns contents of RHY2 as a double


% --- Executes during object creation, after setting all properties.
function edit86_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit87_Callback(hObject, eventdata, handles)
% hObject    handle to RVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY1 as text
%        str2double(get(hObject,'String')) returns contents of RVY1 as a double


% --- Executes during object creation, after setting all properties.
function edit87_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit88_Callback(hObject, eventdata, handles)
% hObject    handle to RVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY2 as text
%        str2double(get(hObject,'String')) returns contents of RVY2 as a double


% --- Executes during object creation, after setting all properties.
function edit88_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit89_Callback(hObject, eventdata, handles)
% hObject    handle to RVY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY3 as text
%        str2double(get(hObject,'String')) returns contents of RVY3 as a double


% --- Executes during object creation, after setting all properties.
function edit89_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit90_Callback(hObject, eventdata, handles)
% hObject    handle to RVY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY4 as text
%        str2double(get(hObject,'String')) returns contents of RVY4 as a double


% --- Executes during object creation, after setting all properties.
function edit90_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit91_Callback(hObject, eventdata, handles)
% hObject    handle to RVY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY5 as text
%        str2double(get(hObject,'String')) returns contents of RVY5 as a double


% --- Executes during object creation, after setting all properties.
function edit91_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit92_Callback(hObject, eventdata, handles)
% hObject    handle to RVY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY6 as text
%        str2double(get(hObject,'String')) returns contents of RVY6 as a double


% --- Executes during object creation, after setting all properties.
function edit92_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ALPHA FZ GAMMA k
global FZ0 FY DFZ  KY  SVyk
global PCY1 PDY1 PDY2 PDY3 ...
       PEY1 PEY2 PEY3 PEY4  ...
       PKY1 PKY2 PKY3 PKY4 PKY5 PKY6  ...
       PHY1 PHY2  ...
       PVY1 PVY2 ...
       RBY1 RBY2 RBY3  ...
       RCY1...
       REY1 REY2 ...
       RHY1 RHY2  ...
       RVY1 RVY2 RVY3 RVY4 RVY5 RVY6 ...
       
if get(hObject,'Value')
    %参数
    PKY4=str2double(get(handles.PKY4,'string'));
    PCY1=str2double(get(handles.PCY1,'string'));
    PDY1=str2double(get(handles.PDY1,'string'));PDY2=str2double(get(handles.PDY2,'string'));PDY3=str2double(get(handles.PDY3,'string'));
    PEY1=str2double(get(handles.PEY1,'string'));PEY2=str2double(get(handles.PEY2,'string'));PEY3=str2double(get(handles.PEY3,'string'));PEY4=str2double(get(handles.PEY4,'string'));
    PKY1=str2double(get(handles.PKY1,'string'));PKY2=str2double(get(handles.PKY2,'string'));PKY3=str2double(get(handles.PKY3,'string'));PKY5=str2double(get(handles.PKY5,'string'));PKY6=str2double(get(handles.PKY6,'string'));
    PHY1=str2double(get(handles.PHY1,'string'));PHY2=str2double(get(handles.PHY2,'string'));
    PVY1=str2double(get(handles.PVY1,'string'));PVY2=str2double(get(handles.PVY2,'string'));
    RBY1=str2double(get(handles.RBY1,'string'));RBY2=str2double(get(handles.RBY2,'string'));RBY3=str2double(get(handles.RBY3,'string'));
    RCY1=str2double(get(handles.RCY1,'string'));
    REY1=str2double(get(handles.REY1,'string'));REY2=str2double(get(handles.REY2,'string'));
    RHY1=str2double(get(handles.RHY1,'string'));RHY2=str2double(get(handles.RHY2,'string'));
    RVY1=str2double(get(handles.RVY1,'string'));RVY2=str2double(get(handles.RVY2,'string'));RVY3=str2double(get(handles.RVY3,'string'));RVY4=str2double(get(handles.RVY4,'string'));RVY5=str2double(get(handles.RVY5,'string'));RVY6=str2double(get(handles.RVY6,'string'));

    %变量
 
    %ALPHA =(str2double(get(handles.ALPHA,'string')))*pi/180;
    %FZ=str2double(get(handles.FZ,'string'));   
    %GAMMA =(str2double(get(handles. GAMMA,'string')))*pi/180;   
    %k=str2double(get(handles.k,'string'));
    %公式
    SHY     = PHY1+ PHY2.* DFZ; %38,  (%55)
    ALPHAY  = ALPHA+SHY;  %30 (%47)
    CY      = PCY1 ;  %32 (%49)
    MUY     = (PDY1+PDY2 .* DFZ) .* (1.0-PDY3 .* GAMMA.^2) ; %34 (%51)
    DY      = MUY .* FZ; %33 (%50)
    KY      = PKY1 .* FZ0 .* sin(PKY4 .* atan(FZ ./ (PKY2 .* FZ0 ))) .* (1.0-PKY3 .* GAMMA.^2); %36 (%53)
    BY      = KY./ (CY .* DY);  %37 (%54)
    KG      = FZ.*(PKY5+PKY6.*DFZ );
    BG      = 2*KG./DY;
% NOTE, PER SVEN @TNO: "SIGN(ALPHAY)"IS CORRECT AS IN DOCUMENTATION & BELOW; IT'S NOT SUPPOSED TO BE "SIGN(GAMMAY)"
    EY      = (PEY1+PEY2 .* DFZ+(PEY3+PEY4.*(GAMMA.^2)).* sign(ALPHAY)); %35 (%52)
% NOTE: LVY MULTIPLIES ONLY PVY1&2 IN DOCUMENTATION; ORIG VERSION MULT ALL TERMS
    SVY     = FZ .* (PVY1+PVY2 .* DFZ); %39 (%56)
    FY0     = DY .* sin(CY .* atan(BY .* ALPHAY-EY .* (BY .* ALPHAY-atan(BY .* ALPHAY))))+0.5*atan(BG.*GAMMA)+SVY; %29 (%46)
    SHyk=RHY1+RHY2*DFZ;
    ks=k+SHyk;
    Byk=cos(atan((ALPHA-RBY3).*RBY2)).*RBY1;
    Cyk=RCY1; 
    Eyk=REY1+REY2*DFZ;

    Dyk=FY0./cos(atan(Byk.*SHyk-(Byk.*SHyk-atan(Byk.*SHyk)).*Eyk).*Cyk);
       
    DVyk=MUY.*FZ.*(RVY1+RVY2*DFZ+GAMMA.*RVY3).*cos(atan(ALPHA.*RVY4));
    SVyk=DVyk.*sin(atan(k.*RVY6).*RVY5);
    FY=Dyk.*cos(atan(Byk.*ks-(Byk.*ks-atan(Byk.*ks)).*Eyk).*Cyk)+SVyk;
    
    set(handles.FY,'string',FY)
end



function FY_Callback(hObject, eventdata, handles)
% hObject    handle to FY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FY as text
%        str2double(get(hObject,'String')) returns contents of FY as a double


% --- Executes during object creation, after setting all properties.
function FY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PVY1_Callback(hObject, eventdata, handles)
% hObject    handle to PVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVY1 as text
%        str2double(get(hObject,'String')) returns contents of PVY1 as a double


% --- Executes during object creation, after setting all properties.
function PVY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PVY2_Callback(hObject, eventdata, handles)
% hObject    handle to PVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PVY2 as text
%        str2double(get(hObject,'String')) returns contents of PVY2 as a double


% --- Executes during object creation, after setting all properties.
function PVY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RBY1_Callback(hObject, eventdata, handles)
% hObject    handle to RBY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBY1 as text
%        str2double(get(hObject,'String')) returns contents of RBY1 as a double


% --- Executes during object creation, after setting all properties.
function RBY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RBY2_Callback(hObject, eventdata, handles)
% hObject    handle to RBY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBY2 as text
%        str2double(get(hObject,'String')) returns contents of RBY2 as a double


% --- Executes during object creation, after setting all properties.
function RBY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RBY3_Callback(hObject, eventdata, handles)
% hObject    handle to RBY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RBY3 as text
%        str2double(get(hObject,'String')) returns contents of RBY3 as a double


% --- Executes during object creation, after setting all properties.
function RBY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RBY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RCY1_Callback(hObject, eventdata, handles)
% hObject    handle to RCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RCY1 as text
%        str2double(get(hObject,'String')) returns contents of RCY1 as a double


% --- Executes during object creation, after setting all properties.
function RCY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RCY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function REY1_Callback(hObject, eventdata, handles)
% hObject    handle to REY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of REY1 as text
%        str2double(get(hObject,'String')) returns contents of REY1 as a double


% --- Executes during object creation, after setting all properties.
function REY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function REY2_Callback(hObject, eventdata, handles)
% hObject    handle to REY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of REY2 as text
%        str2double(get(hObject,'String')) returns contents of REY2 as a double


% --- Executes during object creation, after setting all properties.
function REY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RHY1_Callback(hObject, eventdata, handles)
% hObject    handle to RHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RHY1 as text
%        str2double(get(hObject,'String')) returns contents of RHY1 as a double


% --- Executes during object creation, after setting all properties.
function RHY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RHY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RHY2_Callback(hObject, eventdata, handles)
% hObject    handle to RHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RHY2 as text
%        str2double(get(hObject,'String')) returns contents of RHY2 as a double


% --- Executes during object creation, after setting all properties.
function RHY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RHY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RVY1_Callback(hObject, eventdata, handles)
% hObject    handle to RVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY1 as text
%        str2double(get(hObject,'String')) returns contents of RVY1 as a double


% --- Executes during object creation, after setting all properties.
function RVY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RVY2_Callback(hObject, eventdata, handles)
% hObject    handle to RVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY2 as text
%        str2double(get(hObject,'String')) returns contents of RVY2 as a double


% --- Executes during object creation, after setting all properties.
function RVY2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RVY3_Callback(hObject, eventdata, handles)
% hObject    handle to RVY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY3 as text
%        str2double(get(hObject,'String')) returns contents of RVY3 as a double


% --- Executes during object creation, after setting all properties.
function RVY3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RVY4_Callback(hObject, eventdata, handles)
% hObject    handle to RVY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY4 as text
%        str2double(get(hObject,'String')) returns contents of RVY4 as a double


% --- Executes during object creation, after setting all properties.
function RVY4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RVY5_Callback(hObject, eventdata, handles)
% hObject    handle to RVY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY5 as text
%        str2double(get(hObject,'String')) returns contents of RVY5 as a double


% --- Executes during object creation, after setting all properties.
function RVY5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RVY6_Callback(hObject, eventdata, handles)
% hObject    handle to RVY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RVY6 as text
%        str2double(get(hObject,'String')) returns contents of RVY6 as a double


% --- Executes during object creation, after setting all properties.
function RVY6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RVY6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QEZ1_Callback(hObject, eventdata, handles)
% hObject    handle to QEZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QEZ1 as text
%        str2double(get(hObject,'String')) returns contents of QEZ1 as a double


% --- Executes during object creation, after setting all properties.
function QEZ1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QEZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QEZ2_Callback(hObject, eventdata, handles)
% hObject    handle to QEZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QEZ2 as text
%        str2double(get(hObject,'String')) returns contents of QEZ2 as a double


% --- Executes during object creation, after setting all properties.
function QEZ2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QEZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QEZ4_Callback(hObject, eventdata, handles)
% hObject    handle to QEZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QEZ4 as text
%        str2double(get(hObject,'String')) returns contents of QEZ4 as a double


% --- Executes during object creation, after setting all properties.
function QEZ4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QEZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QBZ1_Callback(hObject, eventdata, handles)
% hObject    handle to QBZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QBZ1 as text
%        str2double(get(hObject,'String')) returns contents of QBZ1 as a double


% --- Executes during object creation, after setting all properties.
function QBZ1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QBZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QBZ2_Callback(hObject, eventdata, handles)
% hObject    handle to QBZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QBZ2 as text
%        str2double(get(hObject,'String')) returns contents of QBZ2 as a double


% --- Executes during object creation, after setting all properties.
function QBZ2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QBZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QBZ4_Callback(hObject, eventdata, handles)
% hObject    handle to QBZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QBZ4 as text
%        str2double(get(hObject,'String')) returns contents of QBZ4 as a double


% --- Executes during object creation, after setting all properties.
function QBZ4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QBZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QBZ5_Callback(hObject, eventdata, handles)
% hObject    handle to QBZ5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QBZ5 as text
%        str2double(get(hObject,'String')) returns contents of QBZ5 as a double


% --- Executes during object creation, after setting all properties.
function QBZ5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QBZ5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QCZ1_Callback(hObject, eventdata, handles)
% hObject    handle to QCZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QCZ1 as text
%        str2double(get(hObject,'String')) returns contents of QCZ1 as a double


% --- Executes during object creation, after setting all properties.
function QCZ1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QCZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QDZ1_Callback(hObject, eventdata, handles)
% hObject    handle to QDZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QDZ1 as text
%        str2double(get(hObject,'String')) returns contents of QDZ1 as a double


% --- Executes during object creation, after setting all properties.
function QDZ1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QDZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QDZ2_Callback(hObject, eventdata, handles)
% hObject    handle to QDZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QDZ2 as text
%        str2double(get(hObject,'String')) returns contents of QDZ2 as a double


% --- Executes during object creation, after setting all properties.
function QDZ2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QDZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QDZ6_Callback(hObject, eventdata, handles)
% hObject    handle to QDZ6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QDZ6 as text
%        str2double(get(hObject,'String')) returns contents of QDZ6 as a double


% --- Executes during object creation, after setting all properties.
function QDZ6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QDZ6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QDZ7_Callback(hObject, eventdata, handles)
% hObject    handle to QDZ7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QDZ7 as text
%        str2double(get(hObject,'String')) returns contents of QDZ7 as a double


% --- Executes during object creation, after setting all properties.
function QDZ7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QDZ7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QDZ8_Callback(hObject, eventdata, handles)
% hObject    handle to QDZ8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QDZ8 as text
%        str2double(get(hObject,'String')) returns contents of QDZ8 as a double


% --- Executes during object creation, after setting all properties.
function QDZ8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QDZ8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QDZ9_Callback(hObject, eventdata, handles)
% hObject    handle to QDZ9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QDZ9 as text
%        str2double(get(hObject,'String')) returns contents of QDZ9 as a double


% --- Executes during object creation, after setting all properties.
function QDZ9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QDZ9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QHZ1_Callback(hObject, eventdata, handles)
% hObject    handle to QHZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QHZ1 as text
%        str2double(get(hObject,'String')) returns contents of QHZ1 as a double


% --- Executes during object creation, after setting all properties.
function QHZ1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QHZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QHZ2_Callback(hObject, eventdata, handles)
% hObject    handle to QHZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QHZ2 as text
%        str2double(get(hObject,'String')) returns contents of QHZ2 as a double


% --- Executes during object creation, after setting all properties.
function QHZ2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QHZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QHZ3_Callback(hObject, eventdata, handles)
% hObject    handle to QHZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QHZ3 as text
%        str2double(get(hObject,'String')) returns contents of QHZ3 as a double


% --- Executes during object creation, after setting all properties.
function QHZ3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QHZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QHZ4_Callback(hObject, eventdata, handles)
% hObject    handle to QHZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QHZ4 as text
%        str2double(get(hObject,'String')) returns contents of QHZ4 as a double


% --- Executes during object creation, after setting all properties.
function QHZ4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QHZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SSZ1_Callback(hObject, eventdata, handles)
% hObject    handle to SSZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SSZ1 as text
%        str2double(get(hObject,'String')) returns contents of SSZ1 as a double


% --- Executes during object creation, after setting all properties.
function SSZ1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SSZ1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SSZ2_Callback(hObject, eventdata, handles)
% hObject    handle to SSZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SSZ2 as text
%        str2double(get(hObject,'String')) returns contents of SSZ2 as a double


% --- Executes during object creation, after setting all properties.
function SSZ2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SSZ2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SSZ3_Callback(hObject, eventdata, handles)
% hObject    handle to SSZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SSZ3 as text
%        str2double(get(hObject,'String')) returns contents of SSZ3 as a double


% --- Executes during object creation, after setting all properties.
function SSZ3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SSZ3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SSZ4_Callback(hObject, eventdata, handles)
% hObject    handle to SSZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SSZ4 as text
%        str2double(get(hObject,'String')) returns contents of SSZ4 as a double


% --- Executes during object creation, after setting all properties.
function SSZ4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SSZ4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ALPHA FZ GAMMA k
global FZ0 DFZ KX KY SVyk
global FX FY

if get(hObject,'Value')
    %参数
    QEZ1=str2double(get(handles.QEZ1,'string'));QEZ2=str2double(get(handles.QEZ2,'string'));QEZ4=str2double(get(handles.QEZ4,'string'));
    QBZ1=str2double(get(handles.QBZ1,'string'));QBZ2=str2double(get(handles.QBZ2,'string'));QBZ4=str2double(get(handles.QBZ4,'string'));QBZ5=str2double(get(handles.QBZ5,'string'));
    QCZ1=str2double(get(handles.QCZ1,'string'));
    QDZ1=str2double(get(handles.QDZ1,'string'));QDZ2=str2double(get(handles.QDZ2,'string'));QDZ9=str2double(get(handles.QDZ9,'string'));QDZ6=str2double(get(handles.QDZ6,'string'));QDZ7=str2double(get(handles.QDZ7,'string'));QDZ8=str2double(get(handles.QDZ8,'string'));
    QHZ1=str2double(get(handles.QHZ1,'string'));QHZ2=str2double(get(handles.QHZ2,'string'));QHZ3=str2double(get(handles.QHZ3,'string'));QHZ4=str2double(get(handles.QHZ4,'string'));
    SSZ1=str2double(get(handles.SSZ1,'string'));SSZ2=str2double(get(handles.SSZ2,'string'));SSZ3=str2double(get(handles.SSZ3,'string'));SSZ4=str2double(get(handles.SSZ4,'string'));

    %变量

    %公式
    R0 = 0.2286;
    BT = (QBZ1+QBZ2 .* DFZ) .* (1.0+QBZ4 .* GAMMA.^2+QBZ5 .* abs(GAMMA)); %48 (%64)
    CT = QCZ1; %49 (%65)
    DT = FZ .* (QDZ1+QDZ2 .* DFZ) .* (R0 ./ FZ0); %50 (%66)
    SHT    = QHZ1+QHZ2 .* DFZ+(QHZ3+QHZ4 .* DFZ) .* GAMMA; %52 ( %68)
    ALPHAT = ALPHA+SHT;  %43 (%59)
    ALPHATEQ= atan(((tan(ALPHAT)).^2+(KX./KY).^2.*k.^2.*sign(ALPHAT)).^0.5);
% NOTE: EQUATION FOR ET HAS CHANGED FROM PAC97 EQUATION; 2/PI TERM IS NEW.
    ET = (QEZ1+QEZ2 .* DFZ) .* (1.0+QEZ4 .* (2/pi) .* atan(BT .* CT .* ALPHAT)); %51 (%67)
    BR=1;
    DR = FZ .* ((QDZ6+QDZ7 .* DFZ)+(QDZ8+QDZ9 .* DFZ) .* GAMMA) .* R0;
    ALPHAR=ALPHA;
    ALPHAREQ=atan(((tan(ALPHAR)).^2+(KX./KY).^2.*k.^2.*sign(ALPHAR)).^0.5);
    MZR = DR .* cos(atan(BR .* ALPHAREQ)) .* cos(ALPHA); %44 (%60)
    TRAIL = DT .* cos(CT .* atan(BT .* ALPHATEQ-ET .* (BT .* ALPHATEQ-atan(BT .* ALPHATEQ)))) .* cos(ALPHA); 
    S=(SSZ1+FY.*SSZ2./FZ0+(SSZ3+DFZ.*SSZ4).*GAMMA).*R0;
    MZ0= -TRAIL .* (FY-SVyk) + MZR +S.*FX;  %41 (%57)
    MZ = MZ0; %40
    set(handles.MZ,'string',MZ)
end


function MZ_Callback(hObject, eventdata, handles)
% hObject    handle to MZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MZ as text
%        str2double(get(hObject,'String')) returns contents of MZ as a double


% --- Executes during object creation, after setting all properties.
function MZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
