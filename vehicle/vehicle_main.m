function vehicle_main(cmd)
% RUNNING ����״̬ 0ֹͣ 1����
% steer_angle ����ת�� deg
% v ���� mm/s
% t ���� s/step
% f_axes ����ϵ ���
% angle_rate ����ת���ٶ� deg/s
% hzxs ����ת�ǻ���ϵ��
% v_rate ����ʱ��
global RUNNING f_axes
global steer_angle v t
global data_vehicle

% ������ʼ��
for_data_vehicle;
% ����
steer_angle_limit = data_vehicle.steer_angle_limit;%��������ת�Ǽ��� deg
hzxs = data_vehicle.hzxs; %�Զ�����ϵ��
angel_rate = data_vehicle.angel_rate;% deg/s ����ת����ٶ�
v_rate = data_vehicle.v_rate;% ������ٶ� mm/s
t = data_vehicle.t;% s/step
t_n = data_vehicle.t_n;% pause ��ͣϵ��
v_limit = data_vehicle.v_limit;% ��߳��� km/h
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
        [angle0,p0] = vehicle_a(0,0,0);% ��ʼλ��
        data_p{1} = p0;
        n = 1;
        while(RUNNING)
            % ת�����
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
            % ����
            [angle1,p1] = vehicle_a(steer_angle,v,t);% ���λ��
            p2 = rotate_point(p0(1,:),p0,angle1);% ��һ����������ת angle1 deg
            p3 = rotate_point([0,0],p1(1,:),angle0);% ��ǰʱ����������ת angle0 deg
            p(:,1) = p2(:,1)+p3(1,1);
            p(:,2) = p2(:,2)+p3(1,2);
            p0 = p;
            angle0 = angle1+angle0;
            data_p{n+1} = p0;
            n = n+1;
            % ��ͼ
            p_view = p(2:end,:);
%             if rem(n,20)==0
%                hold off
%             else
               hold on
%             end
            plot(f_axes,p_view(:,1),p_view(:,2));
            point_fix_plot;
            axis([-10000+p(1,1) 10000+p(1,1) -10000+p(1,2) 10000+p(1,2)]);
            legend(['���٣�',num2str(v/1000*3.6),'km/h ','����ת�ǣ�',num2str(steer_angle),'ʱ�䣺',num2str(n*t)]);
            drawnow;
            % ʱ�����
            pause(t*t_n);
        end
    case 'stop'
        RUNNING = 0;
    case 28 % left ��ת
        steer_angle = steer_angle+angel_rate*t;
        if steer_angle > steer_angle_limit
            steer_angle = steer_angle_limit;
        end
    case 29 % right ��ת
        steer_angle = steer_angle-angel_rate*t;
        if steer_angle < -steer_angle_limit
            steer_angle = -steer_angle_limit;
        end
    case 97 % a ����
        v = v+v_rate*t;
        if v > v_limit/3.6*1000
            v = v_limit/3.6*1000;
        end
    case 122 % z ����
        v = v-v_rate*t;
        if v < 0
            v = 0;
        end
    case 32 % �ո�� ��ͣ
        RUNNING = 0;
end