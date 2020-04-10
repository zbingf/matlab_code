function varargout = Adjust_mass_Preload(varargin)
% ADJUST_MASS_PRELOAD MATLAB code for Adjust_mass_Preload.fig
%      ADJUST_MASS_PRELOAD, by itself, creates a new ADJUST_MASS_PRELOAD or raises the existing
%      singleton*.
%
%      H = ADJUST_MASS_PRELOAD returns the handle to a new ADJUST_MASS_PRELOAD or the handle to
%      the existing singleton*.
%
%      ADJUST_MASS_PRELOAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADJUST_MASS_PRELOAD.M with the given input arguments.
%
%      ADJUST_MASS_PRELOAD('Property','Value',...) creates a new ADJUST_MASS_PRELOAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Adjust_mass_Preload_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Adjust_mass_Preload_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Adjust_mass_Preload

% Last Modified by GUIDE v2.5 30-Nov-2017 22:31:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Adjust_mass_Preload_OpeningFcn, ...
                   'gui_OutputFcn',  @Adjust_mass_Preload_OutputFcn, ...
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


% --- Executes just before Adjust_mass_Preload is made visible.
function Adjust_mass_Preload_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Adjust_mass_Preload (see VARARGIN)

% Choose default command line output for Adjust_mass_Preload
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Adjust_mass_Preload wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Adjust_mass_Preload_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function adjust_mass_Callback(hObject, eventdata, handles)
% set(handles.preload_view,'value',0);
if get(handles.adjust_mass,'value')
    set(handles.adjust_mass_panel,'visible','on');
else
    set(handles.adjust_mass_panel,'visible','off');
end

function preload_Callback(hObject, eventdata, handles)
% set(handles.adjust_mass_view,'value',0);
if get(handles.preload,'value')
    set(handles.preload_panel,'visible','on');
else
    set(handles.preload_panel,'visible','off');
end


function mass_Callback(hObject, eventdata, handles) % 整车总质量 kg

function Ixx_Callback(hObject, eventdata, handles) % 整车绕质心转动惯量 Ixx

function Iyy_Callback(hObject, eventdata, handles) % 整车绕质心转动惯量 Iyy

function Izz_Callback(hObject, eventdata, handles) % 整车绕质心转动惯量 Izz

function full_cg_Callback(hObject, eventdata, handles) % 整车质心坐标（x,y,z）

function marker_name_Callback(hObject, eventdata, handles) % marker点

function part_name_Callback(hObject, eventdata, handles) % 车身部件名

function trailer_spring_Callback(hObject, eventdata, handles) % 铰接车桥-弹簧文件名（含后缀）

function rear2_spring_Callback(hObject, eventdata, handles) % 随动桥-弹簧文件名（含后缀）

function rear_spring_Callback(hObject, eventdata, handles) % 后桥-弹簧文件名（含后缀）

function front_spring_Callback(hObject, eventdata, handles) % 前桥-弹簧文件名（含后缀）

function run_main_Callback(hObject, eventdata, handles) % 运行按钮

function input_asy_Callback(hObject, eventdata, handles) % asy文件导入

function input_txt_Callback(hObject, eventdata, handles) % 设置导入

function output_txt_Callback(hObject, eventdata, handles) % 设置保存
