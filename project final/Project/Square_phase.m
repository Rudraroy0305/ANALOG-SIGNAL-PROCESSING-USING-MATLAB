function varargout = Square_phase(varargin)
% SQUARE_PHASE MATLAB code for Square_phase.fig
%      SQUARE_PHASE, by itself, creates a new SQUARE_PHASE or raises the existing
%      singleton*.
%
%      H = SQUARE_PHASE returns the handle to a new SQUARE_PHASE or the handle to
%      the existing singleton*.
%
%      SQUARE_PHASE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SQUARE_PHASE.M with the given input arguments.
%
%      SQUARE_PHASE('Property','Value',...) creates a new SQUARE_PHASE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Square_phase_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Square_phase_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Square_phase

% Last Modified by GUIDE v2.5 19-Jul-2021 10:43:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Square_phase_OpeningFcn, ...
                   'gui_OutputFcn',  @Square_phase_OutputFcn, ...
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


% --- Executes just before Square_phase is made visible.
function Square_phase_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Square_phase (see VARARGIN)

% Choose default command line output for Square_phase
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Square_phase wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Square_phase_OutputFcn(hObject, eventdata, handles) 
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
fa=str2num(get(handles.edit1,'String'));
am=str2num(get(handles.edit2,'String'));
wm=2*pi*fa;
Ta=1/fa;

t=0:Ta/999:10*Ta;
B=1;
%message
m=am*cos(2*pi*fa*t);
axes(handles.axes1);

plot(t,m);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fa=str2num(get(handles.edit1,'String'));
am=str2num(get(handles.edit2,'String'));

Ta=1/fa;

t=0:Ta/999:10*Ta;
B=1;
fc=fa/4;
wc=2*pi*fc;
wa=2*pi*fc;
%carrier
ym=square(wc*t);



axes(handles.axes1);

plot(t,ym);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fa=str2num(get(handles.edit1,'String'));
am=str2num(get(handles.edit2,'String'));

Ta=1/fa;

t=0:Ta/999:10*Ta;
B=1;
fc=fa/4;
wa=2*pi*fa;
wc=2*pi*fc;
ym=square(wc*t);

%modulation
y=am*cos(2*pi*fa*t+(B.*ym));
axes(handles.axes1);

plot(t,y);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fa=str2num(get(handles.edit1,'String'));
am=str2num(get(handles.edit2,'String'));

Ta=1/fa;

t=0:Ta/999:10*Ta;
B=1;
fc=fa/4;
wa=2*pi*fa;
wc=2*pi*fc;
ym=square(wc*t);
%demodulation

y=am*cos(wa*t+(B.*ym));
ym=y.*square(wc*t);

axes(handles.axes1);

plot(t,ym);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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
phase_selection
