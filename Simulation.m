function [Xp,Re,tspan] = Simulation(e,inc)
% Constant gravitational Constant
Mu = 398600.4;
% Radius of the Earth
Re = 6378;
% Perigee Altitude
hp = 2000;
% Radius of Perigee
rp = 6378 + hp;
% Apogee Altitude
ha = 8000;
% Radius of Apogee
ra = 6378 + ha;
% Right Ascension of the Ascending Node
Omega = 40;
% Argument of Perigee
w = 40;
% Mean Anomaly
theta = 20;
% Semi-major Axis
a = (rp + ra)/2;
% Orbital Period
T = ((2*pi)/(sqrt(Mu)))*a(1)^(3/2);

% Function used to convert Classical Orbital Elements to Positional Vectors
[position,velocity] = OE_to_RV(a,e,inc,Omega,w,theta,Mu);

% Initial Conditions
X0 = [position(1),position(2),position(3),velocity(1),velocity(2),velocity(3)];

% Integrate ODEs using Runge-Kutta45 method
tspan= 0:1:T*50;
options = odeset('AbsTol',1e-10,'RelTol',1e-10);
[Tp, Xp] = ode45(@spacedynamics,tspan,X0, options);
end