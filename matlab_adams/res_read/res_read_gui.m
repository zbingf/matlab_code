function varargout = res_read_gui(varargin)
% res数据检索


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @res_read_gui_OpeningFcn, ...
    'gui_OutputFcn',  @res_read_gui_OutputFcn, ...
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


% --- Executes just before res_read_gui is made visible.
function res_read_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.

% Choose default command line output for res_read_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = res_read_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);

% Get default command line output from handles structure
varargout{1} = handles.output;

function entity_Callback(hObject, eventdata, handles)

function entity_name_Callback(hObject, eventdata, handles)

function component_name_Callback(hObject, eventdata, handles)

function res_input_Callback(hObject, eventdata, handles)
% [res_name,res_path,ans_a]=uigetfile('*.res','导入res文件');
% if ans_a
%     res_adr=[res_path,res_name];
%     res_adr='C:\Users\ABing\Documents\MATLAB\01-matlab_adams\test2_brake.res';
% %     data_str=res_import_nospace(res_adr);
%     data=res_import_str(res_adr);
%     assignin('base','data',data)
    result_add_Callback(hObject, eventdata, handles)
%     handles=guidata(hObject)
    a=handles.userdata.test
    
% end




function result_add_Callback(hObject, eventdata, handles)
a=1;
handles.userdata.test=a;
guidata(hObject,handles)

function result_delete_Callback(hObject, eventdata, handles)

function data_output_Callback(hObject, eventdata, handles)

function data=res_import_nospace(res_adr)
% 读取txt类型数据
% 输出元胞数据，无空格、无空行、小写

res_id=fopen(res_adr,'r');
data=cell(1);
n1=1;
while ~feof(res_id)
    tline=fgetl(res_id);
    a=find(isspace(tline));
    tline(a)=[];
    if ~length(tline)==0
        % 
        tline=lower(tline);
        if strncmp('<steptype="input">',tline,7)
            break
        end
        data(n1)=cellstr(tline);
        n1=n1+1;
    end
    
end
data=data';
fclose(res_id);
