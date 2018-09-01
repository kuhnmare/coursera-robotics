close all;
clear;

% Hover
%z_des = 0;

% Step
z_des = 1;

% Given trajectory generator
trajhandle = @(t) fixed_set_point(t, z_des);

% This is your controller
controlhandle = @controller;

% Run simulation with given trajectory generator and controller
[t, z] = height_control(trajhandle, controlhandle);

% overshoot should be <5%, z=0.9 should take under 1s
disp('z(1s) = ')
disp(z(101))
disp('maxZ ')
disp(max(z)) 
