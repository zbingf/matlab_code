% point_fix_plot
% 固定点作图
point_fix = [5000,20000;5000,-20000];% 固定坐标 mm

plot(f_axes,point_fix(:,1),point_fix(:,2));

point_fix = [-5000,20000;-5000,-20000];% 固定坐标 mm

plot(f_axes,point_fix(:,1),point_fix(:,2));