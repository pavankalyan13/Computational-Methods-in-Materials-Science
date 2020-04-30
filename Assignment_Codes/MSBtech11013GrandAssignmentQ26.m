h=0.5; % step's size
%1/2 -- 7 elements
%1/4 -- 13 elements
%1/8 -- 25 elements
x1 = 0:h:3;
x2 = 0:h/2:3;
x3 = 0:h/4:3;

%% function calls
[x1,y1] = Eulermethod(h,length(x1))
[x2,y2] = Eulermethod(h/2,length(x2))
[x3,y3] = Eulermethod(h/4,length(x3))

%% Function handles for Analytical function
YAnalyticalF =@(x) 1./((x.^2) + 1);
yanalytical = YAnalyticalF(x3)

%% Plots
plot(x1,y1)
hold on;
grid minor;
plot(x2,y2)
plot(x3,y3)
plot(x3,yanalytical)
legend('Euler method with h=0.5','Euler method with h=0.25','Euler method with h=0.125','Analytical solution')
xlabel('X values');
ylabel('Y values');
title('26Q Eulers Method');
hold off;


%%Function definitions -- Euler's Method
 %The given function takes two inputs and output the values of x and y
function [x,y] = Eulermethod(h,n)
y(1)=1;
x(1) =0;
for i=1:n-1
y(i+1)= y(i)+ h*(-2*x(i)*((y(i)).^2));
x(i+1)= x(1) + i*h;
end 
end
