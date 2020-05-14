clear all;clc
x = pi/4;
h = pi/12;
%% Function handles for all
f =@(x) sin(x);
derivative_byforwardapproxo1 =@(x,h) (f(x+h)-f(x) )/h;
derivative_byforwardapproxo2 =@(x,h) (-3*f(x)+4*f(x+h)-f(x+2*h))/(2*h);
derivative_bybackwardapproxo1 =@(x,h) (f(x)-f(x-h))/h
derivative_bybackwardapproxo2 =@(x,h) (-3*f(x-h) + 4*f(x) - f(x-2*h) )/(2*h);
derivative_bycentraldifferenceapproxo2 =@(x,h) (f(x+h)-f(x-h))/(2*h);

derivative_bycentraldifferenceapproxo4 =@(x,h) (-f(x+2*h) + 8*f(x+h)-f(x-h) +f(x-2*h))/(12*h);

%% Function calls
dfp01 = derivative_byforwardapproxo1(x,h)
dfp02 =derivative_byforwardapproxo2(x,h)
dbp01 = derivative_bybackwardapproxo1(x,h)
dbp02 = derivative_bybackwardapproxo2(x,h)
dbc02 = derivative_bycentraldifferenceapproxo2(x,h)
dbc04 = derivative_bycentraldifferenceapproxo4(x,h)

%% Analytical solution is
analytical_solution = cos(pi/4)

%% True percent of relative error is
dfpo1_er = ((dfp01-analytical_solution)/analytical_solution)*100;
dfpo2_er = ((dfp02-analytical_solution)/analytical_solution)*100;
dbpo1_er = ((dbp01-analytical_solution)/analytical_solution)*100;
dbpo2_er = ((dbp02-analytical_solution)/analytical_solution)*100;
dbco2_er = ((dbc02-analytical_solution)/analytical_solution)*100;
dfco4_er = ((dbc04-analytical_solution)/analytical_solution)*100;

%% printing all solutions
fprintf('\nDerivate by forward approximation for O(h) is %f andRelative error is %f',dfp01,dfpo1_er);
fprintf('\nDerivate by forward approximation for O(h^2) is %f andRelative error is %f\n',dfp02,dfpo2_er);
fprintf('\nDerivate by backward approximation for O(h) is %f andRelative error is %f\n',dbp01,dbpo1_er);
fprintf('\nDerivate by backward approximation for O(h^2) is %f andRelative error is %f\n',dbp02,dbpo2_er);
fprintf('\nDerivate by central approximation for O(h^2) is %f andRelative error is %f\n',dbc02,dbco2_er);
fprintf('\nDerivate by central approximation for O(h^4) is %f andRelative error is %f\n',dbc04,dfco4_er);