function data = LV(alpha,beta,delta,gamma,T,res)
%LV() Returns a (res,T) matrix containing data generated using the
%Lotka-Volterra Model in a coordinate frame that rotates at the speed of
%the first wave. The number of wavefronts is fixed at 3. Refer Fig 6b


% Left to Meilan
% Dummy data here that approximately looks reasonable
data = zeros(res,T);
gss = @(mu,sd,x) 1/(2*pi*sd)*exp(-(x-mu).^2/(2*sd^2));
sd = res/100;
for i=1:T
    centers = [res*5/6,res*(1/2+0.1*sin(20*pi/T*i)),res*(0.3-0.1*cos(20*pi/T*i))];
    data(:,i) = gss(centers(1),sd,linspace(1,res,res))+gss(centers(2),sd,linspace(1,res,res))+gss(centers(3),sd,linspace(1,res,res));

end

