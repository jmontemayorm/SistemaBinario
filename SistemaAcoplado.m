clear

% Vector order:
% y(1) = d\phi
% y(2) = dv

[t, y] = ode45(@AuxSistAc, 0.1:0.001:30, [0; 200]);
