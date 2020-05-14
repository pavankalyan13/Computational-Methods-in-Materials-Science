%% Fiven data points and function

t = linspace(0,2*pi,8);
f = @(t) (sin(t)).^2;
ft = f(t);
%%points where function needed to be evaluated
evaluatingpoints = linspace(0,2*pi,100);

%% Building Matrix

%construct a vandermond matrix. I got the following matrix.
% or else I can call a function to create a vandermond matrix
A = [ 1 0 0 0 0 0 0 0; 1 0.8976 (0.8976).^2 (0.8976).^3 (0.8976).^4 ...
(0.8976).^5 (0.8976).^6 (0.8976).^7; 1 1.7952 (1.7952).^2 (1.7952).^3 ....
(1.7952).^4 (1.7952).^5 (1.7952).^6 (1.7952).^7;...
1 2.6928 (2.6928).^2 (2.6928).^3 (2.6928).^4 (2.6928).^5 ... 
(2.6928).^6 (2.6928).^7; 1 3.5904 (3.5904).^2 (3.5904).^3 (3.5904).^4 ... 
(3.5904).^5 (3.5904).^6 (3.5904).^7;...
1 4.4880 (4.4880).^2 (4.4880).^3 (4.4880).^4 (4.4880).^5 ... 
(4.4880).^6 (4.4880).^7; 1 5.3856 (5.3856).^2 (5.3856).^3 (5.3856).^4 ...
(5.3856).^5 (5.3856).^6 (5.3856).^7;...
1 6.2832 (6.2832).^2 (6.2832).^3 (6.2832).^4 (6.2832).^5 ... 
(6.2832).^6 (6.2832).^7];
%Here B is the function values at the known points using the actual
%function
B = ((sin(t)).^2)';
% now this is of the form AX = B where A is the vandermond equation.
%After
% doing the X = A\B we get the coeficients
coeficients = inv(A)*B;
% But the problem here is that the coefficients are in reverse order
%that
% means they are from a0 a1... an but we want to start with an. So I
%used
% matlab builtin fliplr which basically accepts a row matrix and flips
%it.
% I converted it into a row matrix
coeficients = coeficients';
%Then used the fliplr function to obtained a polynomial
p = fliplr(coeficients);
%evaluated the obtained polynmial with the evaluating points
fvalues = polyval(p,evaluatingpoints);

%% Plot 
plot(evaluatingpoints,fvalues);
hold on;
grid minor;
xlabel('t values');
ylabel('f(t) values');
f2spline = interp1(t,ft,evaluatingpoints,'spline');
plot(evaluatingpoints,f2spline);
plot(evaluatingpoints,f(evaluatingpoints));
legend('seventh-order interpolating polynomial','A Cubic Spline','f(t)= (sin(t))^2' );

