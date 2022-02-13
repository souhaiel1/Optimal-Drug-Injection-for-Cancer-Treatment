
function [C, Ceq] = constraints (lesu)
global P0 Q0 T rho
Ceq = [];
[~,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],lesu);
C = max(-xx(:,1)-xx(:,2)+rho);
end

