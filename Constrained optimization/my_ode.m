function xdot = my_ode(t,x,lesu)
global gamma alpha lambda delta beta
u = udet(t, lesu);
xdot = [(gamma-delta-alpha-u)*x(1) + beta*x(2); alpha*x(1) - (lambda + beta)*x(2); u];
end


