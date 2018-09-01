function [F, M] = controller(t, state, des_state, params)
%CONTROLLER  Controller for the quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [x; y; z], state.vel = [x_dot; y_dot; z_dot],
%   state.rot = [phi; theta; psi], state.omega = [p; q; r]
%
%   des_state: The desired states are:
%   des_state.pos = [x; y; z], des_state.vel = [x_dot; y_dot; z_dot],
%   des_state.acc = [x_ddot; y_ddot; z_ddot], des_state.yaw,
%   des_state.yawdot
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls


% =================== Your code goes here ===================

PID = struct;
PID.kpf = 10;
PID.kdf = 1;
PID.kpt = 10;
PID.kdt = 1;
PID.kpp = 10;
PID.kdp = 1;
PID.kpos = [10; 10; 500]; % [x, y, z]
PID.kvel = [10; 10; 30]; % [xdot, ydot, zdot]

ep = des_state.pos - state.pos;
ev = des_state.vel - state.vel;

des_statevars = struct;
des_statevars.rdotdot = des_state.acc + PID.kpos.*ep + PID.kvel.*ev; % [r1dotdot, r2dotdot, r3dotdot]

des_statevars.rot.phi = (des_statevars.rdotdot(1)*sin(des_state.yaw) - des_statevars.rdotdot(2)*cos(des_state.yaw))/params.gravity;
des_statevars.rot.theta = (des_statevars.rdotdot(1)*cos(des_state.yaw) + des_statevars.rdotdot(2)*sin(des_state.yaw))/params.gravity;
des_statevars.rot.psi = des_state.yaw;

des_statevars.omega.p = 0;
des_statevars.omega.q = 0;
des_statevars.omega.r = des_state.yawdot;


g = params.gravity;
m = params.mass;

% Thrust - u1
F = m*(g + PID.kvel(3)*(0 - state.vel(3)) + PID.kpos(3)*(des_state.pos(3) - state.pos(3)));

% Moment - u2
M = [
    PID.kpf*(des_statevars.rot.phi - state.rot(1)) + PID.kdf*(des_statevars.omega.p - state.omega(1));
    PID.kpt*(des_statevars.rot.theta - state.rot(2)) + PID.kdt*(des_statevars.omega.q - state.omega(2));
    PID.kpp*(des_statevars.rot.psi - state.rot(3)) + PID.kdp*(des_statevars.omega.r - state.omega(3))
];

% =================== Your code ends here ===================

end
