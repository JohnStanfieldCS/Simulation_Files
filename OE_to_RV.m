function [position,velocity] = OE_to_RV(a,e,inc,Omega,w,theta,Mu)

% Semi-lattus Rectum 
p = a*(1-e^2);
% Specific angular momentum
h = sqrt((p*Mu));

vecR = [cosd(theta);sind(theta);0];

% Initial Position
Ri = (h^2/Mu)*(1/(1+e*cosd(theta)))*vecR;
% Initial Velocity
Vi = Mu/h * [-sind(theta);e+cosd(theta);0];

% First rotation
T1 = [cosd(w) sind(w) 0; -sind(w) cosd(w) 0; 0 0 1];
% Second rotation
T2 = [1 0 0; 0, cosd(inc), sind(inc);0 -sind(inc) cosd(inc)];
% Third rotation
T3 = [cosd(Omega) sind(Omega) 0; -sind(Omega) cosd(Omega) 0; 0 0 1];

% Direct Consine Matrix (Transformation Matrix)
DCM = T1*T2*T3;
T = DCM';

position = T * Ri;
velocity = T * Vi;
end