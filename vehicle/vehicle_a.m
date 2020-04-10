function [angle_yaw,point] = vehicle_a(steer_angle,v,t)

global data_vehicle

lf = data_vehicle.lf;% ���ĵ�ǰ�� mm
lr = data_vehicle.lr;% ���ĵ����� mm
wheel_track = data_vehicle.wheel_track; % �־� mm
point_data = data_vehicle.point_data;% ������
% ����Ĭ�� ���꣨0,0��
point_mass = [0,0];
point = [point_mass;point_data];

if steer_angle ~= 0
    r = (lf+lr)./sind(steer_angle);% ת��뾶
    if steer_angle > 0
        p5 = [-abs((lf+lr)/tand(steer_angle)+wheel_track/2),-lr];
        r_c = (p5(1)^2+p5(2)^2)^0.5;% mm ������ת�뾶
        angle_rate = v/r_c*180/pi;% ��ڽ��ٶ� deg/s
    elseif steer_angle < 0
        p5 = [abs((lf+lr)/tand(steer_angle)-wheel_track/2),-lr];
        r_c = (p5(1)^2+p5(2)^2)^0.5;% mm ������ת�뾶
        angle_rate = -v/r_c*180/pi;% ��ڽ��ٶ� deg/s
    end
else
    angle_rate = 0;
end
if angle_rate ==0
    s = v*t;%λ��
    point(:,2) = point(:,2)+s;
    angle_yaw = 0;
else
    angle_yaw = angle_rate *t;
    p_d = rotate_point(p5,point_mass,angle_yaw);% ����λ����
    point = rotate_point(point_mass,point,angle_yaw);% ������������λ����
    point(:,1) = point(:,1)+p_d(1);
    point(:,2) = point(:,2)+p_d(2);
end
end