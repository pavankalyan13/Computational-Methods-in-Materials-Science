%%given data poitns
xall = [-0.2 0.3 0.7 -0.3 0.1];
yall = [1.23 2.34 -1.05 6.51 -0.06];

%% point of order 2 and first three poitns
x = [ -0.2 0.3 0.7];
y = [1.23 2.34 -1.05];
d = divdiff(x,y);
t = 0.4;
po = evnewt(d,x,t);
fprintf('Using the first three points. f(0.4) is %g',po);

%%points of last three
x2 = [0.7 -0.3 0.1];
y2 = [-1.05 6.51 -0.06];
d2 = divdiff(x2,y2);
po2 = evnewt(d2,x2,t);
fprintf('\n\nUsing the last three points. f(0.4) is %g',po2);


%%best set of three points
x3 = [0.1 0.3 0.7];
y3 = [-0.06 2.34 -1.05];
d3 = divdiff(x3,y3);
po3 = evnewt(d3,x3,t);
fprintf('\n\nUsing the Best set of three points.which are neighbours of 0.4 that is 0.1 0.3 0.7. so f(0.4) is %g',po3);

%%by using all points
d4 = divdiff(xall,yall);
po4 = evnewt(d4,xall,t);
fprintf('\n\nUsing all points. f(0.4) is %g\n',po4);
% xasc = [-0.3 -0.2 0.1 0.3 0.7];
% yasc = [6.51 1.23 -0.06 2.34 6.51];
% d4 = divdiff(xasc,yasc);
% po5 = evnewt(d4,xasc,t)

%%divided difference function which returns values of d

function d = divdiff(x,y)
% d = divdiff(x,y)
% compute coefficients of Newton form of interpolating polynomial
% x: vector of nodes
% y: vector of y-values at nodes
% d: vector of Newton coefficients
% d = [ f[x_1,...,x_n], f[x2,...,x_n], ..., f[x_n] ]
% use evnewt to evaluate interpolating polynomial
n = length(x);
d = y;
for k=1:n-1
for i=1:n-k
d(i) = (d(i+1)-d(i))/(x(i+k)-x(i));
end
end
end
%%Function which finds the value of given point using the d from
%divided
%%difference
function p = evnewt(d,x,t)
% y = evnewt(d,x,t)
% evaluate Newton form of interpolating polynomial
% d: vector of divided difference coefficients as computed by divdiff
% x: vector of nodes
% t: vector of evaluation points
% p: vector of values of interpolating polynomial
%
p = d(1)*ones(size(t));
for i=2:length(d)
p = p.*(t-x(i)) + d(i);
end
end