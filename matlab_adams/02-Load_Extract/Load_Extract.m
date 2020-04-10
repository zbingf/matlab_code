function varargout = Load_Extract(varargin)
% 载荷提取
% Last Modified by GUIDE v2.5 23-Mar-2019 16:39:56
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Load_Extract_OpeningFcn, ...
    'gui_OutputFcn',  @Load_Extract_OutputFcn, ...
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

function Load_Extract_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
% 启动运行项
mfileaddr = which(mfilename);
mfilepath = fileparts(mfileaddr);
cd(mfilepath);
% 初始表格设置
ColumnFormat = {'char','char','char','char','char'};
ColumnEditable = [true,true,true,true,true];
emptyCell = cell(100,5);
for n = 1:500
    emptyCell{n}=' ';
end
set(handles.uitable1,'data',emptyCell,'ColumnFormat',ColumnFormat,'ColumnEditable',ColumnEditable);
% textDisp设置
textDisp = {' ',' '};

% handles.userdata 更新
handles.userdata.textDisp = textDisp;
handles.userdata.mfilepath = mfilepath;
guidata(hObject, handles);
global handlesLoadExtract
handlesLoadExtract = handles;
% 界面切换
switchDisp_general(handles)

function varargout = Load_Extract_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function pushbutton_run_Callback(hObject, eventdata, handles)
% 读取数据 生成 dataFull
run('uitable_read.m');

% textDisp显示
textDisp = handles.userdata.textDisp;
textDisp{2} = '完成运行';
set(handles.textDisp,'string',textDisp);
% handles.userdata 更新
handles.userdata.textDisp = textDisp;
handles.userdata.dataFull = dataFull;
guidata(hObject, handles);
global handlesLoadExtract
handlesLoadExtract = handles;


function pushbutton_res_Callback(hObject, eventdata, handles)
textDisp = handles.userdata.textDisp;
[filename,pathname,temp_a] = uigetfile('*.res','选择对应res文件');
if temp_a
    res_addr = [pathname,filename];
    [data,data_str] = res_importdata(res_addr);
    textDisp{1} = res_addr;
    textDisp{2} = '成功-导入-res文件';
else
    textDisp{2} = '未-导入-新res文件-依旧使用旧文件';
end
% textDisp显示
set(handles.textDisp,'string',textDisp);
% handles.userdata 更新
handles.userdata.textDisp = textDisp;
handles.userdata.data = data;
handles.userdata.data_str = data_str;
guidata(hObject, handles);
global handlesLoadExtract
handlesLoadExtract = handles;

function pushbutton_cfgInput_Callback(hObject, eventdata, handles)
textDisp = handles.userdata.textDisp;
[filename,pathname,temp_a] = uigetfile('*.mat','选择对应车型的配置参数mat文件');
mat_addr = [pathname,filename];
if temp_a
    load(mat_addr);
    set(handles.uitable1,'data',data);
    textDisp{2} = '成功-导入mat-配置文件';
else
    textDisp{2} = '未-导入mat-配置文件';
end
% textDisp显示
set(handles.textDisp,'string',textDisp);
% handles.userdata 更新
handles.userdata.textDisp = textDisp;
guidata(hObject, handles);
global handlesLoadExtract
handlesLoadExtract = handles;

function pushbutton_cfgOutput_Callback(hObject, eventdata, handles)
textDisp = handles.userdata.textDisp;
data = get(handles.uitable1,'data');
[filename,pathname,temp_a] = uiputfile('*.mat','选择对应车型的配置参数mat文件');
if temp_a
    mat_addr = [pathname,filename];
    save(mat_addr,'data');
    textDisp{2} = '成功-保存mat-配置文件';
else
    textDisp{2} = '未-保存mat-配置文件';
end
% textDisp显示
set(handles.textDisp,'string',textDisp);
% handles.userdata 更新
handles.userdata.textDisp = textDisp;
guidata(hObject, handles);
global handlesLoadExtract
handlesLoadExtract = handles;

function pushbutton_mat_Callback(hObject, eventdata, handles)
% 读取数据 生成 dataFull
run('uitable_read.m');
save('dataFull.mat','dataFull')
disp('>>>>成功保存dataFull<<<<')
% textDisp显示
textDisp = handles.userdata.textDisp;
textDisp{2} = '成功-生成-dataFull.mat';
set(handles.textDisp,'string',textDisp);
% handles.userdata 更新
handles.userdata.textDisp = textDisp;
handles.userdata.dataFull = dataFull;
guidata(hObject, handles);
global handlesLoadExtract
handlesLoadExtract = handles;


function radiobutton_general_Callback(hObject, eventdata, handles)
temp = get(handles.radiobutton_general,'value');
if temp
    switchDisp_general(handles)
else
    switchDisp_six_component(handles)
end

function radiobutton_six_component_Callback(hObject, eventdata, handles)
temp = get(handles.radiobutton_six_component,'value');
if temp
    switchDisp_six_component(handles)
else
    switchDisp_general(handles)
end

function switchDisp_six_component(handles)
set(handles.radiobutton_six_component,'value',1);
set(handles.radiobutton_general,'value',0);
set(handles.uitable1,'visible','off')
set(handles.pushbutton_run,'visible','on')
set(handles.pushbutton_res,'visible','off')
set(handles.pushbutton_mat,'visible','off')
set(handles.pushbutton_cfgOutput,'visible','off')
set(handles.pushbutton_cfgInput,'visible','off')

function switchDisp_general(handles)
set(handles.radiobutton_six_component,'value',0);
set(handles.radiobutton_general,'value',1);
set(handles.uitable1,'visible','on')
set(handles.pushbutton_run,'visible','off')
set(handles.pushbutton_res,'visible','on')
set(handles.pushbutton_mat,'visible','on')
set(handles.pushbutton_cfgOutput,'visible','on')
set(handles.pushbutton_cfgInput,'visible','on')
