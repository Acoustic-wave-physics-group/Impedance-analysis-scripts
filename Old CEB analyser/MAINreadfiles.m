% script. MAIN read and convert data from Old Impedance Analyser

name = 'lid'; %'spacer'; %'simplecoin';'simplecoinselect'; 'nocoin'

% addpath('C:\Users\Tobey\Desktop\New folder\rawdata\simplecoin');
% addpath('C:\Users\Tobey\Desktop\New folder\rawdata\nocoin');
% addpath('C:\Users\Tobey\Desktop\New folder\rawdata\simplecoinselect');
% addpath('C:\Users\Tobey\Desktop\New folder\rawdata\spacer');
addpath('C:\Users\Tobey\Desktop\New folder\rawdata\lid');

% dd = dir('C:\Users\Tobey\Desktop\New folder\rawdata\simplecoin\*.TXT'); %'*.TXT'
% dd = dir('C:\Users\Tobey\Desktop\New folder\rawdata\nocoin\*.TXT'); %'*.TXT'
% dd = dir('C:\Users\Tobey\Desktop\New folder\rawdata\simplecoinselect\*.TXT'); %'*.TXT'
% dd = dir('C:\Users\Tobey\Desktop\New folder\rawdata\spacer\*.TXT'); %'*.TXT'
dd = dir('C:\Users\Tobey\Desktop\New folder\rawdata\lid\*.TXT'); %'*.TXT'

fileNames = {dd.name};

frequency = importfrequency(fileNames{1});

datanames = cell(numel(fileNames),1); %initialise
datanames(:,1) = fileNames;
data = zeros(numel(fileNames),length(frequency)); %initialise

for ii = 1:numel(fileNames)    
   data(ii,:) = (str2double(importfileOldImpedanceAnalyser([fileNames{ii}])))';
end

csvwrite([name '.csv'],data')
csvwrite('frequency.csv',frequency)


%% plot

% fillvolume = [{'8.0 ml'} {'7.0 ml'} {'6.0 ml'} {'5.0 ml'} {'4.8 ml'} {'4.4 ml'} {'4.3 ml'}...
%     {'4.2 ml'} {'4.1 ml'} {'4.0 ml'} {'3.9 ml'} {'3.8 ml'} {'3.7 ml'} {'3.6 ml'}...
%     {'3.4 ml'} {'3.2 ml'} {'3.0 ml'} {'2.5 ml'} {'2.0 ml'} {'1.0 ml'} {'0.0 ml'}];
% fillvolume = [{'8.0 ml'} {'7.0 ml'} {'6.0 ml'} {'5.0 ml'} {'4.0 ml'} {'3.0 ml'} {'2.0 ml'} {'1.0 ml'} {'0.0 ml'}];
fillvolume = [{'8.0 ml'} {'9.0 ml'} {'10.0 ml'} {'11.0 ml'} {'11.5 ml'} {'lid-coin'}];

xLabel = 'Frequency, f(MHz)';
yLabel = 'Impedance, Z (V/A)';

% --- Common variables
FontSize = 16;%12;
FontName = 'MyriadPro-Regular'; %'CMU Sans Serif';% or choose any other font
doExportPlot = true;

% Set colors for plot lines
set(0,'DefaultAxesColorOrder',jet(size(datanames,1)));%parula,winter,jet,hot

% --- figure dimensions 
% figure_width = 8.5;%16;
% figure_height = 5.4;%10;
figure_width = 20+2;
figure_height = 10-1;

% --- setup plot windows
figuresVisible = 'on'; % 'off' for non displayed plots (will still be exported)
hfig = figure(1); clf;
    set(hfig,'Visible', figuresVisible)

    set(hfig, 'units', 'centimeters', 'pos', [5 5 figure_width figure_height])   
    set(hfig, 'PaperPositionMode', 'auto');    
    set(hfig, 'Renderer','painters'); %'painters' 'Zbuffer' 'opengl'
    set(hfig, 'Color', [1 1 1]); % Sets figure background
    set(gca, 'Color', [1 1 1]); % Sets axes background

% --- dimensions and position of plot 
hsp = subplot(1,1,1, 'Parent', hfig);
% % set(hsp,'Position',[0.15 0.17 0.75 0.80]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LineWidth = 1;%1.5;

% plot(frequency./(10^6),data(3,:),frequency./(10^6),data(4,:),'Linewidth',LineWidth); hold on
% legend('wet', 'dry')

for ii = 1:numel(fileNames)
    plot(frequency./(10^6),data(ii,:),'Linewidth',LineWidth); hold on
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- setup axis plot properties
set(gca, ...
    'Box'         , 'on'      , ...
    'LooseInset'  , get(gca, 'TightInset') * 1.5 , ...
    'TickDir'     , 'in'      , ...
    'TickLength'  , [.015 .015] , ...
    'XMinorTick'  , 'off'      , ...
    'YMinorTick'  , 'off'     , ...
    'XGrid'       , 'on'     , ...
    'YGrid'       , 'on'     , ...
    'LineWidth'   , 0.6      );

% --- 
% Legend: fillvolume or datanames
hleg = legend((fillvolume),'Location','SouthEastOutside');%,'NorthEast');
set(hleg, 'FontSize', (FontSize -4), 'FontName', FontName,'Box', 'off')%,'9' if takes up too much space  'Box', 'off', %%%'FitBoxToText', 'on');

hXLabel = xlabel(xLabel);
hYLabel = ylabel(yLabel);

% ---  set properties for all handles
set([gca, hXLabel, hYLabel], ...
    'FontSize'   , FontSize    , ...
    'FontName'   , FontName);

% bring axis on top again (fix matlab bug)
set(gca,'Layer', 'top');

hold off

% ---  export
drawnow
SaveDir = '';
if (doExportPlot)
    IMAGENAME = [SaveDir name]; 
    print(hfig, ['-r' num2str(400)], [IMAGENAME '.jpg' ], ['-d' 'jpeg']);
%     print(hfig, ['-r' num2str(400)], [IMAGENAME '.svg' ], ['-d' 'svg']);  
%     crop([IMAGENAME '.png']);
    display('finished plot export')
end
