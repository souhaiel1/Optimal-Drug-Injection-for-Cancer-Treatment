function J = cost(lesu)
global gamma alpha lambda delta beta mu P0 Q0 T
[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],lesu);
J = xx(end,1) + mu*xx(end,3);
end


