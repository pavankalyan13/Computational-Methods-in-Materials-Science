p = [ 400 -900 675 -200 25 0.2];
intp = polyint(p);
a = 0;
b = 0.8;
y =@(x,a,b) (400*(((b-a)/2)*x + (b+a)/2).^5 -900*(((b-a)/2)*x + (b ...
+a)/2).^4 +675*(((b-a)/2)*x + (b+a)/2).^3 - 200*(((b-a)/2)*x + (b ...
+a)/2).^2 +25*(((b-a)/2)*x + (b+a)/2)+0.2)*((b-a)/2)
Analytical_sol = diff(polyval(intp,[a b]))
%Analytical solution is 1.6405
%%atob{f(x)dx = -1 to 1 {f((((b-a)/2)*x + (b+a)/2)) * (b-a)/2
% so simply put the new value of x as
% new_x = (((b-a)/2)*x + (b+a)/2)
% in y
% y =@(x) 400*x.^5 -900*x.^4 +675*x.^3 - 200*x.^2 +25*x+0.2
%it will become as follows
%Using 2point formula we get the solution as 1.8226
%it will be simply w1*f(x1) + w2*f(x2) as we changed the integrals as
%for 2 point w1 and w2 are 1
integ_from2point = y(-1/sqrt(3),a,b) + y(1/sqrt(3),a,b)
fprintf('The Error is %f%% \n',((integ_from2point - Analytical_sol)/...
Analytical_sol)* 100);
%%now using 3point formula we get the solution as this
integ_from3point = (0.555556)*y(-0.774596669,a,b) + (0.88889)*y(0,a,b)...
+ (0.555556)*y(0.77459669,a,b)
fprintf('The Error is %f%% \n',((integ_from3point - Analytical_sol)/ ...
Analytical_sol)* 100 );