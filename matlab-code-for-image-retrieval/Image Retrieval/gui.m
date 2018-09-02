function varargout = gui(varargin)

% GUI M-file for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args
% hObject    handle to figure
% handles    structure with handles and user data
% varargin   command line arguments to gui

% Choose default command line output for gui

handles.output = hObject;

a=imread('min.bmp');

axes(handles.axes34);
imshow(a);

axes(handles.axes35);
imshow(a);

axes(handles.axes36);
imshow(a);

axes(handles.axes37);
imshow(a);

axes(handles.axes38);
imshow(a);

axes(handles.axes39);
imshow(a);

axes(handles.axes40);
imshow(a);

axes(handles.axes41);
imshow(a);

axes(handles.axes42);
imshow(a);

axes(handles.axes43);
imshow(a);

axes(handles.axes44);
imshow(a);

axes(handles.axes45);
imshow(a);

axes(handles.axes46);
imshow(a);

axes(handles.axes47);
imshow(a);

axes(handles.axes48);
imshow(a);

axes(handles.axes49);
imshow(a);

axes(handles.axes50);
imshow(a);

axes(handles.axes51); 
imshow(a);

axes(handles.axes52);
imshow(a);

axes(handles.axes53);
imshow(a);

axes(handles.axes54);
imshow(a);

axes(handles.axes55);
imshow(a);

axes(handles.axes56);
imshow(a);

axes(handles.axes57);
imshow(a);

axes(handles.axes58);
imshow(a);

axes(handles.axes59);
imshow(a);

axes(handles.axes60);
imshow(a);

axes(handles.axes61);
imshow(a);

axes(handles.axes62);
imshow(a);

axes(handles.axes63);
imshow(a);


b=imread('max.bmp');
axes(handles.one);
imshow(b);

% 
% Update handles structure

guidata(hObject, handles);

% UIWAIT makes gui wait for user response
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.

function varargout = gui_OutputFcn(hObject, eventdata, handles)

% varargout  cell array for returning output args;
% hObject    handle to figure
% handles    structure with handles and user data

% Get default command line output from handles structure

varargout{1} = handles.output;


% --- Executes on button press in Load_Database.

function Load_Database_Callback(hObject, eventdata, handles)

% hObject    handle to Load_Database 
% handles    structure with handles and user data

a=exist('database.txt');

if a>0
    msgbox('Database Already Loaded,Contains 70 Images');
else
fid = fopen('database.txt', 'w+');
for i=1:70
    a=num2str(i);
    b='.jpg';
    c1='.bmp';
    filename=strcat(a,c1);
    fprintf(fid,'%s\r',filename);
end
fclose(fid);
helpdlg('Database succesfully loaded...');
end

% --- Executes on button press in Browse.

function Browse_Callback(hObject, eventdata, handles)

% hObject    handle to Browse (see GCBO)
% handles    structure with handles and user data (see GUIDATA)

        [filename, pathname] = uigetfile('*.bmp', 'Pick an Image');
        
        if isequal(filename,0) | isequal(pathname,0)
        
        warndlg('Image is not selected');

        
        else
        a=imread(filename);
        handles.queryx=a;
        axes(handles.one);
        imshow(a);
        handles.filename=filename;
        
        guidata(hObject, handles);  
        
        end
 


% --- Executes on button press in Search.

function Search_Callback(hObject, eventdata, handles)

% hObject    handle to Search
% handles    structure with handles and user data

filename=handles.filename;
[X1] = imread(filename);
HSVmap1 = rgb2hsv(X1);

%--------------- Open database txt file... for reading...

fid = fopen('database.txt');
resultValues = [];      % Results matrix...
resultNames = {};
i = 1;                  % Indices...
j = 1;

while 1
    imagename = fgetl(fid);
    if ~ischar(imagename), break, end       % Meaning: End of File...

     [X] = imread(imagename);
     HSVmap = rgb2hsv(X);
  
    [D1,D2,D3] = quadratic1(X1,  HSVmap1, X, HSVmap);
     resultValues1(i) = D1;
     resultValues2(i) = D2;
     resultValues3(i) = D3;
     resultNames(j) = {imagename};
     i = i + 1;
     j = j + 1;
end

fclose(fid);


% Sorting colour results...

[sortedValues1, index1] = sort(resultValues1);     % Sorted results... the vector index
[sortedValues2, index2] = sort(resultValues2); 
[sortedValues3, index3] = sort(resultValues3); % is used to find the resulting files.

%------------------RED------------------------------------------------

for i = 1:10                                        % Store top 10 matches...

    tempstr = char(resultNames(index1(i)));

        if i==1;
        x=imread(tempstr);
        axes(handles.axes34);
        imshow(x);
        end

        if i==2
        x=imread(tempstr);
        axes(handles.axes35);
        imshow(x);
        end

        if i==3
        x=imread(tempstr);
        axes(handles.axes36);
        imshow(x);
        end

        if i==4
        x=imread(tempstr);
        axes(handles.axes37);
        imshow(x);
        end

        if i==5
        x=imread(tempstr);
        axes(handles.axes38);
        imshow(x);
        end

        if i==6
        x=imread(tempstr);
        axes(handles.axes39);
        imshow(x);
        end

        if i==7
        x=imread(tempstr);
        axes(handles.axes40);
        imshow(x);
        end

        if i==8
        x=imread(tempstr);
        axes(handles.axes41);
        imshow(x);
        end

        if i==9
        x=imread(tempstr);
        axes(handles.axes42);
        imshow(x);
        end

        if i==10
        x=imread(tempstr);
        axes(handles.axes43);
        imshow(x);
        end

end



%------------------GREEN----------------------------------------------



for i = 1:10                                        % Store top 10 matches...
    tempstr = char(resultNames(index2(i)));
        if i==1;
        x=imread(tempstr);
        axes(handles.axes44);
        imshow(x);
        end

        if i==2
        x=imread(tempstr);
        axes(handles.axes45);

        imshow(x);
        end

        if i==3
        x=imread(tempstr);
        axes(handles.axes46);
        imshow(x);
        end
        if i==4
        x=imread(tempstr);
        axes(handles.axes47);
        imshow(x);
        end

        if i==5
        x=imread(tempstr);
        axes(handles.axes48);
        imshow(x);
        end
        if i==6
        x=imread(tempstr);
        axes(handles.axes49);
        imshow(x);
        end
        if i==7
        x=imread(tempstr);
        axes(handles.axes50);
        imshow(x);
        end
        if i==8
        x=imread(tempstr);
        axes(handles.axes51);
        imshow(x);
        end
        if i==9
        x=imread(tempstr);
        axes(handles.axes52);
        imshow(x);
        end

        if i==10
        x=imread(tempstr);
        axes(handles.axes53);
        imshow(x);
        end

end

%------------------BLUE-----------------------------------------------

for i = 1:10                                        % Store top 10 matches...
    tempstr = char(resultNames(index3(i)));
        if i==1;
        x=imread(tempstr);
        axes(handles.axes54);
        imshow(x);
        end

        if i==2
        x=imread(tempstr);
        axes(handles.axes55);

        imshow(x);
        end

        if i==3
        x=imread(tempstr);
        axes(handles.axes56);
        imshow(x);
        end

        if i==4
        x=imread(tempstr);
        axes(handles.axes57);
        imshow(x);
        end

        if i==5
        x=imread(tempstr);
        axes(handles.axes58);
        imshow(x);
        end

        if i==6
        x=imread(tempstr);
        axes(handles.axes59);
        imshow(x);
        end

        if i==7
        x=imread(tempstr);
        axes(handles.axes60);
        imshow(x);
        end

        if i==8
        x=imread(tempstr);
        axes(handles.axes61);
        imshow(x);
        end

        if i==9
        x=imread(tempstr);
        axes(handles.axes62);
        imshow(x);
        end

        if i==10
        x=imread(tempstr);
        axes(handles.axes63);
        imshow(x);
        end
    
end



% --------------------------------------------------------------------

% --- Executes on button press in clear.

function clear_Callback(hObject, eventdata, handles)

% hObject    handle to clear 
% handles    structure with handles and user data

a=imread('min.bmp');

axes(handles.axes34);
imshow(a);

axes(handles.axes35);
imshow(a);

axes(handles.axes36);
imshow(a);

axes(handles.axes37);
imshow(a);

axes(handles.axes38);
imshow(a);

axes(handles.axes39);
imshow(a);

axes(handles.axes40);
imshow(a);

axes(handles.axes41);
imshow(a);

axes(handles.axes42);
imshow(a);

axes(handles.axes43);
imshow(a);

axes(handles.axes44);
imshow(a);

axes(handles.axes45);
imshow(a);

axes(handles.axes46);
imshow(a);

axes(handles.axes47);
imshow(a);

axes(handles.axes48);
imshow(a);

axes(handles.axes49);
imshow(a);

axes(handles.axes50);
imshow(a);

axes(handles.axes51);
imshow(a);

axes(handles.axes52);
imshow(a);

axes(handles.axes53);
imshow(a);

axes(handles.axes54);
imshow(a);

axes(handles.axes55);
imshow(a);

axes(handles.axes56);
imshow(a);

axes(handles.axes57);
imshow(a);

axes(handles.axes58);
imshow(a);

axes(handles.axes59);
imshow(a);

axes(handles.axes60);
imshow(a);

axes(handles.axes61);
imshow(a);

axes(handles.axes62);
imshow(a);

axes(handles.axes63);
imshow(a);


b=imread('max.bmp');
axes(handles.one);
imshow(b);

delete database.txt;
% delete *.txt;
warndlg('database deleted successfully');


% --- Executes on button press in BACK.

function BACK_Callback(hObject, eventdata, handles)

% hObject    handle to BACK
% handles    structure with handles and user data


