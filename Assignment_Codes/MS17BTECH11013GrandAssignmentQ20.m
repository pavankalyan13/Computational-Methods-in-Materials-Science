%% funcion handles
y1 =@(x) x.^3 + 4*x -15;
y2 =@(x) (x.^2)*cos(x);
y3 =@(x) sin(sqrt(x)/2)/x;
%% step sizes
h1 = 0.25;
h2 = 0.1;
h3 = 0.2;
%% evaluating values
x1 = 0;
x2 = 0.4;
x3 = 1;
%% Analytical function handles
dy1An =@(x) 3*x^2 + 4;
dy2An =@(x) 2*x*cos(x) - x^2*sin(x);
dy3An =@(x) cos(x^(1/2)/2)/(4*x^(3/2)) - sin(x^(1/2)/2)/x^2;
%%Central difference
% we know the central difference for O(h4) is f'(x) = -f(x+2h)+8f(x+h)-8f(x-h)+f(x-2h) / 12h + e(f,h);
Y1 = centraldifference(x1,y1,h1)
Y2 = centraldifference(x2,y2,h2)
Y3 = centraldifference(x3,y3,h3)
Y1analy = dy1An(x1)
Y2analy = dy2An(x2)
Y3analy = dy3An(x3)
%% function def
function yeval = centraldifference(x,f,h)
yeval = (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h)) / (12*h);
end