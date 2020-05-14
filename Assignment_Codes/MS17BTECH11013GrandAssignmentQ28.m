% Divide the interval into 8 nodes,so the step size is pi/7
h = pi/7;
%x values
x = 0:pi/7:pi;
%After expansion of y'' and y' using finite element method we get a
%% matrix
%of type Ax = B where x is the coefficients matrix with y values from y1 to y8
%% Matrices
%you can manually enter the matrix or use matlab inbuilt functions
%A = [ 1 0 0 0 0 0 0 0; 2+h -4 2-h 0 0 0 0 0; 0 2+h -4 2-h 0 0 0 0; 00 2+h -4 2+h 0 0 0;...
% 0 0 0 2+h -4 2-h 0 0; 0 0 0 0 2+h -4 2-h 0; 0 0 0 0 0 2+h -4 2-h; 0 0 0 0 0 0 0 1]

A = full(gallery('tridiag',8,2+h,-4,2-h));
A(1,:) = [ 1 0 0 0 0 0 0 0];
A(8,:) = [ 0 0 0 0 0 0 0 1];
A
B = [0 2*(h.^2)*cos(pi/7) 2*(h.^2)*cos(2*pi/7) 2*(h.^2)*cos(3*pi/7)2*(h.^2)*cos(4*pi/7)...
    2*(h.^2)*cos(5*pi/7) 2*(h.^2)*cos(6*pi/7) 1]'
%%y values are obtained by A \ B from Ay = B
y_values = inv(A)*B

%% Analytical function
yanalytical =@(x) -1/2*sin(x) - 1/2*cos(x) + 1/2

%% plots
plot(x,y_values);
hold on;
grid minor;
plot(0:pi/15:pi,yanalytical(0:pi/15:pi))
legend('y from finite element method','Y Analytical solution:-1/2*sin(x)-1/2*cos(x)+1/2');
title('Question 28');
xlabel('x values in degrees');
ylabel('y values');
hold off;
