y =@(x) (exp(x)*sin(x))/(1+x.^2)
fprintf('Modified will be');
% x_new = (((b-a)/2)*x + (b+a)/2)
a = 0;
b = 2;
y =@(x,a,b) ((exp((((b-a)/2)*x + (b+a)/2))*sin((((b-a)/2)*x + (b ...
+a)/2)))/(1+(((b-a)/2)*x + (b+a)/2).^2))*((b-a)/2) ...
integ_2point = y(-1/sqrt(3),a,b) + y(1/sqrt(3),a,b)
integ_3point = (0.555556)*y(-0.774596669,a,b) + (0.88889)*y(0,a,b) + ...
(0.555556)*y(0.77459669,a,b)
integ_4point = (0.347854)*y(-0.8611363,a,b) + ...
(0.6521451)*y(-0.339981,a,b)...
+(0.6521451)*y(0.339981,a,b) + ...
(0.347854)*y(0.8611363,a,b) ...
integ_5point = (0.2369268)*y(-0.906179846,a,b) + ...
(0.4786286)*y(-0.538469310,a,b)...
+(0.56888889)*y(0,a,b) + ...
(0.4786286)*y(0.538469310,a,b)...
+ (0.2369268)*y(-0.906179846,a,b) ...
integ_6point = (0.171324492)*y(-0.9324695,a,b) + ...
(0.360761573)*y(-0.6612093,a,b)...
+ (0.4679139)*y(-0.2386191,a,b) + ...
(0.4679139)*y(0.2386191,a,b)...
+ (0.360761573)*y(0.6612093,a,b) + ...
(0.171324492)*y(0.9324695,a,b)