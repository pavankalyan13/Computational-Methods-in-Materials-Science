clear all;clc

%% Given Data
p = 2;
h1 = pi/3;
h2 = pi/6;
x = pi/4;

%% function handles for central formula of O(h^2)
g=@(x,h) (cos(x+h) - cos(x-h))/(2*h);

%%Analytical function handles
yAnalyticalfun =@(x) -sin(x);

%% solutions
derivative_byRichardson = ((2.^p)*g(x,h2) - g(x,h1) )/( (2.^p) -1)
derivative_byanalytical = yAnalyticalfun(x)