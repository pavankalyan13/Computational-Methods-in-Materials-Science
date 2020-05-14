% Given step size h = 0.5 and Interval is [0,2]
%Step Size
h = 0.5;
%% values
x = 0:h:2;
y1 = zeros(5,1);
y2 = zeros(5,1);
% Given Initial values
y1(1) = 4;
y2(1) = 6;
%% Function Handles
%here f is dy1/dx and g is dy2/dx
f =@(Y1) -0.5*Y1;
g =@(x,Y1,Y2) 4 - 0.3*Y2 -0.1*Y1;
% Upon Integrating the given functions we the values of y1 and y2 inthe
% given interval
%% loop for Euler's method
for i=1:4
y1(i+1) = y1(i) + h*f(y1(i));
y2(i+1) = y2(i) + h*g(x(i),y1(i),y2(i));
end

%% plots
plot(x,y1)
hold on;
grid minor;

plot(x,y2);
xlabel('X values');
ylabel('Y values');
legend('y1','y2');
title('Q27 Eulers Method');
hold off;
x
y1
y2
