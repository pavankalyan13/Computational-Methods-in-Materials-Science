%%Given data
x = [ 1.5 1.9 2.1 2.4 2.6 3.1];
y = [ 1.0628 1.3961 1.5432 1.7349 1.8423 2.0397];
%%we need to evaluate at 3 nearest neighbour points of 1.75
xevalp = [ 1.5 1.9 2.1];
yevalp = [ 1.0628 1.3961 1.5432];
%order of polynomial interpolation is 3
n = 3;
A = [ n sum(xevalp) sumofsq(xevalp);sum(xevalp) sumofsq(xevalp) ...
sumofcub(xevalp);sumofsq(xevalp) sumofcub(xevalp) sumof4th(xevalp) ];
B = [sum(yevalp) sumxy(xevalp,yevalp) sumyx2(xevalp,yevalp) ]';
poly = (A\B);
poly = poly';

%% calculating the derivates of the polynomial
dp = polyder(poly);
dp2 = polyder(dp);
%% Calculating the value of the given point
first_derivate = polyval(dp,1.75);
second_derivate_value = polyval(dp2,1.75);
%% Solution is here
fprintf('The coefficents of polynomial are');
poly
fprintf('\nThe First Derivative is %f and \n\nsecond derivative is %f\n',first_derivate,second_derivate_value)

%% set of functin for calculating the sums of x andy
function sum1 = sum(x)
sum1 = 0;
for i = 1:length(x)
sum1 = sum1 + x(i);
i = i+1;
end
end
function sum2 = sumofsq(x)
sum2 = 0;
for i = 1:length(x)
sum2 = sum2 + (x(i)).^2;
i = i+1;
end
end
function sum3 = sumofcub(x)
sum3 = 0;
for i = 1:length(x)
sum3 = sum3 + (x(i)).^3;
i = i+1;
end
end
function sum4 = sumof4th(x)
sum4 = 0;
for i = 1:length(x)
sum4 = sum4 + (x(i)).^4;
i = i+1;
end
end
function sum5 = sumxy(x,y)
sum5 = 0;
for i = 1:length(x)
sum5 = sum5 + y(i)*x(i);
i = i+1;
end
end
function sum6 = sumyx2(x,y)
sum6 = 0;
for i = 1:length(x)
sum6 = sum6 + y(i)*((x(i).^2));
i = i +1;
end 
end
