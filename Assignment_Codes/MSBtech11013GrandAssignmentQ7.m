%% Given Data
x1 = [3 5];
x2 = [3 5 7];
x3 = [2 3 5 7];
y1 = [19 99];
y2 = [19 99 291];
y3 = [6 19 99 291];
xp = 4; % calculate f(x=4)

%% function calls
lagrangepolynoOrder1 = lagrangeinterpolation(x1,y1,xp)
lagrangepolynoOrder2 = lagrangeinterpolation(x2,y2,xp)
lagrangepolynoOrder3 = lagrangeinterpolation(x3,y3,xp)

%% Function declaration

function yp = lagrangeinterpolation(x,y,xp)
n = length(x)-1;
sum = 0;
for i = 1:n+1
pr = 1;
for j = 1:n+1
if j ~= i
pr = pr * (xp-x(j))/(x(i)-x(j));
end
end
sum = sum + y(i) *pr;
end
yp = sum;
end

