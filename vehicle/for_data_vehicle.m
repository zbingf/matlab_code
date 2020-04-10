% 整车参数
data_vehicle.lf = 3000;% 质心到前轴 mm
data_vehicle.lr = 3000;% 质心到后轴 mm
data_vehicle.wheel_track = 2250; % 轮距 mm

data_vehicle.steer_angle_limit =40;%车轮外轮转角极限 deg
data_vehicle.hzxs = 0.8; %自动回正系数
data_vehicle.angel_rate = 10;% deg/s 车轮转向角速度
data_vehicle.v_rate = 2*1000;% 纵向加速度 mm/s
data_vehicle.t = 0.1;% s/step
data_vehicle.t_n = 0.2;% pause 暂停系数
data_vehicle.v_limit = 60;% 最高车速 km/h

%% 点坐标

p1 = [-2000,5000];% 左前
p2 = [2000,5000];% 右前
p3 = [2000,-5000];% 右后
p4 = [-2000,-5000];% 左后

data_vehicle.point_data = [p1;p2;p3;p4;p1];% 轮距 mm

% data_vehicle.point_fix = [5000,20000;5000,-20000];% 固定坐标 mm
% point_fix = data_vehicle.point_fix ;
% plot(point_fix(:,1),point_fix(:,2));