%% Given data points
cycles = [1 10 100 1000 10000 100000 1000000];
stress = [1100 1000 925 800 625 550 420];
lncycles = log(cycles);
lnstress = log(stress);

%% finding slopes and intercepts
[m,i] = line_regression(lncycles,lnstress);
% the question said that there is a linear relationship in log log

%% plot
% we can say that it is of the form y = mx + c
% that means lny = m lnx + c;
% I found the values of m and c using linear regression
% Convert the lny equation to y = form by applying the exp obs

%% function handles
y_logregression =@(x,m,i) m*log(x) + i;
y_actual =@(x,m,i) exp(i)*(x.^m);

%% plots
subplot(1,2,1)
plot(cycles,stress,'o');
hold on;
xlabel('cycles');
ylabel('stress');
grid minor;
plot(cycles, y_actual(cycles,m,i));
legend('Given data points', 'y = x*exp(m) + exp(i)');
hold off;
title('Q14');
subplot(1,2,2)
plot(lncycles,lnstress,'*');
hold on;

grid minor;
xlabel('log cycles');
ylabel('log stress');
plot(lncycles,y_logregression(cycles,m,i));
legend('Given data points', 'log regression');
title('Q14');
hold off;


%% function calls
function [m,i] = line_regression(x,y)
m = sum( y.*(x - mean(x)))/sum(x.*(x - mean(x)));
i = mean(y) - m*mean(x);
end
