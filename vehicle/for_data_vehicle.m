% ��������
data_vehicle.lf = 3000;% ���ĵ�ǰ�� mm
data_vehicle.lr = 3000;% ���ĵ����� mm
data_vehicle.wheel_track = 2250; % �־� mm

data_vehicle.steer_angle_limit =40;%��������ת�Ǽ��� deg
data_vehicle.hzxs = 0.8; %�Զ�����ϵ��
data_vehicle.angel_rate = 10;% deg/s ����ת����ٶ�
data_vehicle.v_rate = 2*1000;% ������ٶ� mm/s
data_vehicle.t = 0.1;% s/step
data_vehicle.t_n = 0.2;% pause ��ͣϵ��
data_vehicle.v_limit = 60;% ��߳��� km/h

%% ������

p1 = [-2000,5000];% ��ǰ
p2 = [2000,5000];% ��ǰ
p3 = [2000,-5000];% �Һ�
p4 = [-2000,-5000];% ���

data_vehicle.point_data = [p1;p2;p3;p4;p1];% �־� mm

% data_vehicle.point_fix = [5000,20000;5000,-20000];% �̶����� mm
% point_fix = data_vehicle.point_fix ;
% plot(point_fix(:,1),point_fix(:,2));