function [E,Omega,theta,w,inc,a] = RV_to_OE(vel,pos,Mu)

r = norm(pos);
V = norm(vel);

% Calcualte Radial Velocity
dotv = dot(pos,vel);
Vr = dotv/r;

% Calculate Specific Angular momentum
h = cross(pos,vel);
H = norm(h);

% Calculate Inclination
inc = acosd(h(3)/H); 

% Calculate Node Line
K = [0, 0, 1];
n = cross(K,h);
N = norm(n); 

% Calculate Right Ascension of Ascending Node
if n(2) >= 0 
    Omega = acosd(n(1)/N);
else
    Omega = 360 - acosd(n(1)/N);
end

% Calculate Eccentricity
e = (1/Mu)*((((V^2)-(Mu/r))*pos)-((r*Vr)*vel));
%e = 1/Mu * ((V^2 - Mu/r)*pos - r*Vr*vel); 
E = norm(e);

% Calculate Argument of Perigee (Quadrant based)
dotA = dot(n,e); 
NE = N*E;
if e(3) >= 0
    w = acosd(dotA/NE);
else
    w = 360 - acosd(dotA/NE);
end  

% Calculate the True Anomaly (Quadrant based)
dotT = dot(e,pos);
Er = E*r;
if Vr >=  0
    theta = acosd(dotT/Er);
else
    theta = 360 - acosd(dotT/Er);
end

% Calculate the Parogee & Apogee Radii
Rp = (H^2/Mu) * (1/(1+E));
Ra = (H^2/Mu) * (1/(1-E));

% Calculate the Semimajor Axis of the Ellipse
a = 0.5*(Rp + Ra);
end

