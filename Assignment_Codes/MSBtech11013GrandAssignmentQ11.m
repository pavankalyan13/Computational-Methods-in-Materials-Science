clear all;clc
x = [ 0.9 1.42 1.30 1.55 1.63 1.32 1.35 1.47 1.95 1.66 1.96 1.47 1.92 ...
1.35 1.05...
1.85 1.74 1.65 1.78 1.71 2.29 1.82 2.06 2.14 1.27];
% summation of all values of x
summa = sum(x);
%mean is sum divided by no of terms
meanx = summa/length(x);
sum_diff_frommean = zeros(1,length(x));
sumofsq_diff_frommean = (meanx - x).^2;
sumofsq_diff_frommean;
variance = sum((sumofsq_diff_frommean))/length(x);
stddev = sqrt(variance);
coef_of_variation = (stddev/meanx)*100;
fprintf('\nThe mean is %g',meanx);
fprintf('\nThe variance is %.3f',variance);
fprintf('\nThe standard deviation is %.3f',stddev);
fprintf('\nThe coefficient of variation is %.3f\n',coef_of_variation);

%% functions for finding the sum

function s = sum(x)
s = 0;
for i = 1:length(x)
s = s + x(i);
end
end