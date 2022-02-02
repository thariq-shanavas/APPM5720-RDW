%% Generating data using Lotka-Volterra Equations

% Volterra equation parameters
alpha = 0.07;
beta = 0.13;
delta = 0.10;
gamma = 0.05;

% Data size
T = 1000;   %Number of time steps
res = 360;  %Resolution in x

data = LV(alpha,beta,delta,gamma,T,res);
% Add noise

p = pcolor(data);
p.EdgeColor = 'none';

%% DMD analysis
r = 40;
[Phicol,Lambda,b] = DMD(data(:,1:end-1),data(:,2:end),r);

% Figure 2
figure(2);clf
s = linspace(-1,1,1000);
p1 = plot(real(diag(Lambda)),imag(diag(Lambda)),'o', ...
    s,sqrt(1-s.^2),'-b',s,-sqrt(1-s.^2),'-b');
set(p1(1),'MarkerSize',10);
xlabel('Real part');ylabel('Imaginary part');axis equal
legend('Eigenvalues','Unit Circle');
% Figure 3
figure(3);clf
for j=1:T
    ModeDynamics(:,j) = Phicol*Lambda^(j-1)*b;
end
s = pcolor(real(ModeDynamics));
s.EdgeColor = 'none';
colorbar
%% Koopman Analysis