function vehicle_main(cmd)
% RUNNING 运行状态 0停止 1运行
% steer_angle 车轮转角 deg
% v 车速 mm/s
% t 步长 s/step
% f_axes 坐标系 句柄
% angle_rate 车轮转角速度 deg/s
% hzxs 车轮转角回正系数
% v_rate 加速时间
global RUNNING f_axes
global steer_angle v t
global data_vehicle

% 参数初始化
for_data_vehicle;
% 参数
steer_angle_limit = data_vehicle.steer_angle_limit;%车轮外轮转角极限 deg
hzxs = data_vehicle.hzxs; %自动回正系数
angel_rate = data_vehicle.angel_rate;% deg/s 车轮转向角速度
v_rate = data_vehicle.v_rate;% 纵向加速度 mm/s
t = data_vehicle.t;% s/step
t_n = data_vehicle.t_n;% pause 暂停系数
v_limit = data_vehicle.v_limit;% 最高车速 km/h
%

if ~nargin
    cmd = 'init';
end
if ~(ischar(cmd)||isscalar(cmd))
    return;
end

switch cmd
    case 'init'
        steer_angle=0;v=0;RUNNING=1;
        f = figure('Name','vehicle',...
            'Numbertitle','off',...
            'Menubar','none',...
            'Color',[.95 .95 .95],...
            'DoubleBuffer','on',...
            'Position',[500/2 -400/2 500 400],...
            'Colormap',[.58 .71 .65;.4 .4 .4;0 0 0;1 1 0],...
            'CloseRequestFcn',sprintf('%s(''stop'');closereq;',mfilename),...
            'KeyPressFcn',sprintf('%s(double(get(gcbf,''Currentcharacter'')))',mfilename));
        
        f_axes = axes('Units','normalized',...
            'Position', [0 0 1 1],...
            'Visible','off',...
            'DrawMode','fast',...
            'NextPlot','replace');
        
        vehicle_main('start')
    case 'start'
        [angle0,p0] = vehicle_a(0,0,0);% 初始位置
        data_p{1} = p0;
        n = 1;
        while(RUNNING)
            % 转向回正
            if ~((cmd==28)&(cmd==29))
                if steer_angle > 0
                    steer_angle = steer_angle-hzxs*angel_rate*t;
                    if steer_angle < 0
                        steer_angle = 0;
                    end
                elseif steer_angle < 0
                    steer_angle = steer_angle+hzxs*angel_rate*t;
                    if steer_angle > 0
                        steer_angle = 0;
                    end
                end
            end
            % 运算
            [angle1,p1] = vehicle_a(steer_angle,v,t);% 相对位移
            p2 = rotate_point(p0(1,:),p0,angle1);% 上一刻绕质心旋转 angle1 deg
            p3 = rotate_point([0,0],p1(1,:),angle0);% 当前时刻绕质心旋转 angle0 deg
            p(:,1) = p2(:,1)+p3(1,1);
            p(:,2) = p2(:,2)+p3(1,2);
            p0 = p;
            angle0 = angle1+angle0;
            data_p{n+1} = p0;
            n = n+1;
            % 画图
            p_view = p(2:end,:);
%             if rem(n,20)==0
%                hold off
%             else
               hold on
%             end
            plot(f_axes,p_view(:,1),p_view(:,2));
            point_fix_plot;
            axis([-10000+p(1,1) 10000+p(1,1) -10000+p(1,2) 10000+p(1,2)]);
            legend(['车速：',num2str(v/1000*3.6),'km/h ','车轮转角：',num2str(steer_angle),'时间：',num2str(n*t)]);
            drawnow;
            % 时间控制
            pause(t*t_n);
        end
    case 'stop'
        RUNNING = 0;
    case 28 % left 左转
        steer_angle = steer_angle+angel_rate*t;
        if steer_angle > steer_angle_limit
            steer_angle = steer_angle_limit;
        end
    case 29 % right 右转
        steer_angle = steer_angle-angel_rate*t;
        if steer_angle < -steer_angle_limit
            steer_angle = -steer_angle_limit;
        end
    case 97 % a 加速
        v = v+v_rate*t;
        if v > v_limit/3.6*1000
            v = v_limit/3.6*1000;
        end
    case 122 % z 减速
        v = v-v_rate*t;
        if v < 0
            v = 0;
        end
    case 32 % 空格键 暂停
        RUNNING = 0;
end