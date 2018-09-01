function [ u1, u2 ] = controller(~, state, des_state, params)
%CONTROLLER  Controller for the planar quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [y; z], state.vel = [y_dot; z_dot], state.rot = [phi],
%   state.omega = [phi_dot]
%
%   des_state: The desired states are:
%   des_state.pos = [y; z], des_state.vel = [y_dot; z_dot], des_state.acc =
%   [y_ddot; z_ddot]
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls


% FILL IN YOUR CODE HERE
kvz = 13;
kpz = 18;
kvf = 250;
kpf = 1500;
kvy = 15;
kpy = 5;

des_state_phi = 0;

% Current errors
ez = des_state.pos(2) - state.pos(2);
ezt = des_state.vel(2) - state.vel(2);
ey = des_state.pos(1) - state.pos(1);
eyt = des_state.vel(1) - state.vel(1);

phi_c = -(des_state.acc(1) + kvy*(eyt) + kpy*(ey))/params.gravity;

ef = phi_c - state.rot;
eft = des_state_phi - state.omega;

% Control actions
u1 = params.mass*(params.gravity + des_state.acc(2) + kvz*ezt + kpz*ez);
u2 = params.Ixx*(0 + kvf*eft + kpf*ef);

end

