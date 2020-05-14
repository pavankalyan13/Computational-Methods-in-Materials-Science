y0 = 1;
x1 = 0:1/2:3; % -- 16 points
x2 = 0:1/4:3; % -- 13 points
x3 = 0:1/8:3; % -- 25 points
yAnalyticalVal = zeros(1,length(x3))

%% Analytical part
yanalyticalFun =@(x) x - 2 + 3*exp(-x/2);
yAnalyticalVal = yanalyticalFun(x3);
yAnalyticalVal

%% function calls
y1 = taylexpan(x1,y0,1/2,length(x1))
y2 = taylexpan(x2,y0,1/4,length(x2))
y3 = taylexpan(x3,y0,1/8,length(x3))

%% Plots
plot(x1,y1);
hold on;grid minor;
xlabel('x values')
ylabel('y values')
plot(x2,y2);
plot(x3,y3);
plot(x3,yAnalyticalVal);
legend('Taylorexpforh=1/2','Taylorexpforh=1/4','Taylorexpforh=1/8','Analytical');
hold off;

% common function for taylor expansion
% given fourth order means we need to evaluate till 4th derivate terms only
function yeval = taylexpan(x,y0,h,n)
yeval = zeros(1,n);
yeval(1) = y0;
dy =@(x,y) (x-y)./2;
d2y =@(x,y) (-x+y+2)./4;
d3y = @(x,y) (x-y+2)./8;
d4y =@(x,y) (2+y-x)./16;
for i = 2:n
yeval(i) = y0 + h*dy(x(i),y0) + 1/2*(h.^2)*d2y(x(i),y0) + 1/6 *(h.^3) *d3y(x(i),y0)+...
1/24*(h.^4)*d4y(x(i),y0);
y0 = yeval(i);
end
end