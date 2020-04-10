clear all
clc
fclose all;
%%
fileAdr = 'E:\MATLAB\01-matlab_adams\00-Function Library\class\test.txt';
a = textClass(fileAdr);
% a.ReadAll;
a.data

% b = asyReadClass(fileAdr)
%%
% asy_adr = 'E:\MATLAB\01-matlab_adams\00-Function Library\class\test.txt';
% txt_id = fopen(asy_adr,'r');
% data = cell(1);
% n=1;
% while ~feof(txt_id)
%     tline = fgetl(txt_id);
%     tline(isspace(tline)) = [];
%     if ~length(tline) == 0
%         data(n) = {tline};
%         n=n+1;
%     end
% end
% data = data';
% fclose(txt_id);
% data = lower(data); % Сд
% 
% data_asy = data

