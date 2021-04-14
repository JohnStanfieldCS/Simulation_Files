function [StateVector] = spacedynamics(t,X)
Mu = 398600.4;
r  = [X(1);X(2);X(3)];
v  = [X(4);X(5);X(6)];
R = norm(r);

% J2 Perturbation value
J2 = 1.08263*10^-3;
% Main component of acceleration equation
Amain = (-3/2)*J2*(Mu/R^2)*((6378/R)^2); 

% Accelertion for J2 Perturbations
acceleration_Jx = Amain*((1-5*(r(3)/R)^2)*(r(1)/R));
acceleration_Jy = Amain*((1-5*(r(3)/R)^2)*(r(2)/R));
acceleration_Jz = Amain*((3-5*(r(3)/R)^2)*(r(3)/R));

% Acceleration for two-body dynamics
acceleration_Tx = -(Mu/R^3)*r(1);
acceleration_Ty = -(Mu/R^3)*r(2);
acceleration_Tz = -(Mu/R^3)*r(3);

acceleration_x = acceleration_Tx + acceleration_Jx;
acceleration_y = acceleration_Ty + acceleration_Jy;
acceleration_z = acceleration_Tz + acceleration_Jz;

StateVector = [v(1);v(2);v(3);acceleration_x;acceleration_y;acceleration_z];
return;

