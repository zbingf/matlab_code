clear,clc
% txt_adr='E:\MATLAB\01-matlab_adams\asy_file_test.sub';
txt_adr2='E:\MATLAB\01-matlab_adams\Classs\asy_file_test.asy';
% txt_adr2='E:\MATLAB\01-matlab_adams\Classs\fsae_full_vehicle.asy';

% testh=subsearch(txt_adr)
testh2=asy_file(txt_adr2)


testh2.is_asyfront

testh2.is_cbdsame

testh2.is_asysus

testh2.is_asyfull