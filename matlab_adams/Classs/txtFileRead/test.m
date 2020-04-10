
addpath(genpath('E:\MATLAB\01-matlab_adams\Classs\txtFileRead'));

clear,clc
filePath = 'E:\Software\MSC.Software\Adams\2017_2\acar\shared_car_database.cdb\assemblies.tbl\MDI_Demo_Vehicle.asy';

A = asyFileRead;
A.filePath = filePath;
A.asyRead;
A.data;

filePath = 'C:\Users\ABing\.acar.cfg';
B = cfgFileRead;
B.filePath = filePath;
B.cfgRead
