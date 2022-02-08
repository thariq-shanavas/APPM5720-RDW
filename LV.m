function data = LV(alpha,beta,delta,gamma,T,res)
%LV() Returns a (res,T) matrix containing data generated using the
%Lotka-Volterra Model in a coordinate frame that rotates at the speed of
%the first wave. The number of wavefronts is fixed at 3. Refer Fig 6b

data = zeros(res,T);
gss = @(mu,sd,x) 1/(2*pi*sd)*exp(-(x-mu).^2/(2*sd^2)); % gaussian function
sd = res/10;   % Standard deviation of the gaussian

[~,centers] = ode45(@(t,y) dydt([alpha;beta;gamma;delta],t,y),linspace(1,T,T), [0.1;0.1]);
% scale and flip sign of y(1) (Fig. 7 from paper)
centers(:,1) = -(centers(:,1)-mean(centers(:,1)))/max(abs(centers(:,1)));
centers(:,2) = (centers(:,2)-mean(centers(:,2)))/max(abs(centers(:,2)));
offsets = res*[5/6;3/6;1/6];
for i=1:T
    data(:,i) = gss(offsets(1),sd,linspace(1,res,res))+gss(offsets(2)+res/15*centers(i,1),sd,linspace(1,res,res))+gss(offsets(3)+res/15*centers(i,2),sd,linspace(1,res,res));
end

