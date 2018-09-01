close all;
clear;

addpath('utils');

trajhandle = @traj_generator;

% waypoints = [
%         0 0 0;
%         1 0 4;
%         2 0 2;
%         2 10 4;
%         0 5 4]';
    
waypoints = [0    0   0;
             1    1   1;
             2    0   2;
             3    -1  1;
             4    0   0]';

trajhandle([],[],waypoints);

% Check start and finish positions
start = trajhandle(0, []);
assert(all(ismembertol(waypoints(:,1),start.pos, 1e-5)));

stop  = trajhandle(inf, []);
%assert(all(ismembertol(waypoints(:,end), stop.pos, 1e-5)));

%% Plot trajectory
tstep = 0.1;
t = 0:tstep:100;
r = zeros(3, size(t,2));
v = zeros(3, size(t,2));
a = zeros(3, size(t,2));

for i = 1:size(t,2)
    des_state = trajhandle(t(i), 0); 
    r(:,i) = des_state.pos;
    v(:,i) = des_state.vel;
    a(:,i) = des_state.acc;
end

figure;
hold on;
scatter3(r(1,:),r(2,:),r(3,:));
scatter3(waypoints(1,:),waypoints(2,:),waypoints(3,:),'filled');

hold off;
figure;
hold on;
title('v');
plot(v(1,:));
plot(v(2,:));
plot(v(3,:));
hold off;

figure;
hold on;
title('a');
plot(a(1,:));
plot(a(2,:));
plot(a(3,:));

