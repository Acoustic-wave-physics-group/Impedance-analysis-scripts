function O1 = importfileOldImpedanceAnalyser(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   O1 = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   O1 = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows
%   STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   O1 = importfile('01.TXT',13, 213);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/08/16 22:47:47

%% Initialize variables.
delimiter = '\t';
if nargin<=2
    startRow = 13;
    endRow = inf;
end

%% Format string for each line of text:
%   column2: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%s%*s%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow(1)-1, 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    textscan(fileID, '%[^\n\r]', startRow(block)-1, 'ReturnOnError', false);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
    dataArray{1} = [dataArray{1};dataArrayBlock{1}];
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
O1 = dataArray{:, 1};


