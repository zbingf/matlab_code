function varargout = Simulate_brake(varargin)
% SIMULATE_BRAKE MATLAB code for Simulate_brake.fig
%      SIMULATE_BRAKE, by itself, creates a new SIMULATE_BRAKE or raises the existing
%      singleton*.
%
%      H = SIMULATE_BRAKE returns the handle to a new SIMULATE_BRAKE or the handle to
%      the existing singleton*.
%
%      SIMULATE_BRAKE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULATE_BRAKE.M with the given input arguments.
%
%      SIMULATE_BRAKE('Property','Value',...) creates a new SIMULATE_BRAKE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Simulate_brake_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Simulate_brake_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Simulate_brake

% Last Modified by GUIDE v2.5 29-Nov-2017 22:16:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Simulate_brake_OpeningFcn, ...
                   'gui_OutputFcn',  @Simulate_brake_OutputFcn, ...
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


% --- Executes just before Simulate_brake is made visible.
function Simulate_brake_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Simulate_brake (see VARARGIN)

% Choose default command line output for Simulate_brake
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.import_rdf,'visible','off')
m_path=fileparts(which('Simulate_brake.m'));
cd(m_path);


% UIWAIT makes Simulate_brake wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Simulate_brake_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function output_prefix_Callback(hObject, eventdata, handles) % 输出文件名

function end_time_Callback(hObject, eventdata, handles) %结束时间

function initial_velocity_Callback(hObject, eventdata, handles) % 起始速度

function step_length_Callback(hObject, eventdata, handles) % 总步长

function start_time_Callback(hObject, eventdata, handles) % 制动时间 

function final_brake_Callback(hObject, eventdata, handles) % 最大制动 brake demand

function duration_of_step_Callback(hObject, eventdata, handles) % 制动0~final_brake% 时间

function gear_position_Callback(hObject, eventdata, handles) % 档位设置

function import_asy_Callback(hObject, eventdata, handles) % 导入asy文件

[FileName,PathName,FilterIndex] =uigetfile('*.asy','导入asy文件');
asy_addr=[PathName,FileName];
if ~FilterIndex==0
    set(handles.import_rdf,'visible','on');
    set(handles.asy_addr,'string',asy_addr);
end

function import_rdf_Callback(hObject, eventdata, handles) % 导入rdf路面文件
global rdf_addrA
[FileName,PathName]=uigetfile('*.rdf');
rdf_addrA=[PathName,'/',FileName];
set(handles.rdf_addrA,'string',rdf_addrA);

function default_rdf_Callback(hObject, eventdata, handles) % 默认输入路面文件
global rdf_addrA
rdf_addrA='mdids://acar_shared/roads.tbl/2d_flat.rdf';
set(handles.rdf_addrA,'string',rdf_addrA);

function run_main_Callback(hObject, eventdata, handles)
figure('name','test')
plot(1:100,1:100)
