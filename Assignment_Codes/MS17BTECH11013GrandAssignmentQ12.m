%% Given data points
x = [10 15 20 25 40 50 55 60 75];
y = [5 20 18 40 33 54 70 60 78];

%% calculating mean


meanx = sum(x)/length(x);
meany = sum(y)/length(y);
x_meanx = x - meanx;
y_meany = y - meany;
squaresx = sum(x_meanx.^2);
squaresy = sum(y_meany.^2);
corelation_coef = sum((x_meanx).*(y_meany)) / ...
sqrt((squaresx).*(squaresy))
% y = b0 +b1*x
% where b1 = sumation(x.*y) - sum(x).*sum(y) / ( sum(x.^2) - sum(x).^2/n
% and b0 = mean(y) - b1*means(x);
slope = sum( y.*(x - meanx) ) / sum( x.*(x - meanx) );
intercept = mean(y) - (slope * mean(x))
plot(x,y,'ro')
hold on;
grid minor;
Y =@(x) intercept + slope*x
plot(x,Y(x));
hold off;
yp = Y(x)
legend('Data points','Regression polynomial');
xlabel('X values');
ylabel('Y values');
stnerrorofestimate = sqrt(sum((y-yp).^2)/length(x))
y_at_32 = Y(32)
function m = sum(x)
m = 0;
for i = 1:length(x)
m = m + x(i);
end
m
end