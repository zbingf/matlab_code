function varargout = Fron_SUS_help(varargin)
% FRON_SUS_HELP MATLAB code for Fron_SUS_help.fig
%      FRON_SUS_HELP, by itself, creates a new FRON_SUS_HELP or raises the existing
%      singleton*.
%
%      H = FRON_SUS_HELP returns the handle to a new FRON_SUS_HELP or the handle to
%      the existing singleton*.
%
%      FRON_SUS_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRON_SUS_HELP.M with the given input arguments.
%
%      FRON_SUS_HELP('Property','Value',...) creates a new FRON_SUS_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fron_SUS_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fron_SUS_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fron_SUS_help

% Last Modified by GUIDE v2.5 24-May-2015 18:44:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fron_SUS_help_OpeningFcn, ...
                   'gui_OutputFcn',  @Fron_SUS_help_OutputFcn, ...
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


% --- Executes just before Fron_SUS_help is made visible.
function Fron_SUS_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fron_SUS_help (see VARARGIN)

% Choose default command line output for Fron_SUS_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fron_SUS_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fron_SUS_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
