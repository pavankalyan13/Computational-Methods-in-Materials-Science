%% Given Data
velocity = [ 10 20 30 40 50 60 70 80];
force = [ 25 70 380 550 610 1220 830 1450];

%% plot(velocity,force,'ro');
hold on;
grid minor;
%we need to find the coefficients using least square fit for a secondorder
%polynomial
% p = a0*x^2 + a1 *x + c
% the coefficient matrix that I get is
% The Sol that I get are the coefficients of the second order
% polynomial
p = (leastsquares2ndorder2(velocity,force))'
p = fliplr(p); %% fliping the coefficients becuase they are in the
% reverse order and using the idea of polynomial expressed in array
% form
velocity1 = 10:5:80;
force1 = polyval(p,velocity1);
plot(velocity1,force1);
xlabel('velocity');
ylabel('Force');
legend('Data points','Least-squares fit for second order polynomial');
title('Q 15');
% function b = leastsquares2ndorder1(x,y)
% A = zeros(length(x),3);
% A(:,1) = x.^2;
% A(:,2) = x;
% A(:,3) = 1;
%
% B = y;
%
% b = pinv(A)*B;
% end

%%
function c = leastsquares2ndorder2(x,y)
A = [ length(x) sum(x) sum(x.^2);sum(x) sum(x.^2) sum(x.^3);sum(x.^2) ...
sum(x.^3) sum(x.^4)]
B = [sum(y) sum(x.*y) sum((x.^2).*y) ]';
c = A\B;
end