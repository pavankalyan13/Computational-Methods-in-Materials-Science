%% Given Data
%initial values
x = 0;
y = 1;
% step size
h = 0.2;
dy =@(x,y) -2*x*(y.^2);

%% Derivates till 4th order
d2y = @(x,y) -2*(y.^2)+ 8*(x.^2)*(y.^3);
d3y = @(x,y) 24*x*(y.^3)-48*(x.^3)*(y.^4);
d4y = @(x,y) 24*(y.^3)- 288*(x.^2)*(y.^4) + 384*(x.^4)*(y.^5);
% you can verify values by substituing it here.
% Dy = dy(0,1)
% d2y(0,1)
% d3y(0,1)
% d4y(0,1)
%% Loop for finding y till x=1 with h =5, Taylor series method
for i = 1:5
ynew(i) = y + h*dy(x,y) + 1/2*(h.^2)*d2y(x,y) + 1/6 * (h.^3) ...
*d3y(x,y)+1/24 * (h.^4)*d4y(x,y);
y = ynew(i);
x = h*i;
end
yanalyticalFun =@(x) 1/((x.^2) + 1);
yAnalyticalValue = yanalyticalFun(1);
fprintf('\n For x = %d The value of y using Taylor series method is%f',x,y);
fprintf('\nAnalytical solution at x = 1 is %f\n',yAnalyticalValue);