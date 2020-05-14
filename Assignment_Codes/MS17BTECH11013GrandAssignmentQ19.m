y =@(x) (1-x).^(1/2);
x = 0;
h = 0.2;
xfind = x:0.2:1;
% using inline function I calculated the derivates
dy = @(x) -1/(2*(1 - x)^(1/2));
d2y =@(x) -1/(4*(1 - x)^(3/2));
d3y = @(x) -3/(8*(1 - x)^(5/2));
% by using taylor expansion we get the solution to it
% we need to try for different values of h and number of terms in itto get
% a acurate values upto 2 decimal points
% so I Choose the value to be h = 0.2 till 4 terms
% ynew = y + h*dy(x) + 1/2*(h.^2)*d2y(x) + 1/6 * (h.^3) *d3y(x) + 1/24* (h.^4)*d4y(x);