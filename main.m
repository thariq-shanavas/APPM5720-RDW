clear
%% Generating data using Lotka-Volterra Equations

% Volterra equation parameters
alpha = 0.07;
beta = 0.13;
delta = 0.10;
gamma = 0.05;

% Data size
T = 1000;   %Number of time steps
res = 720;  %Resolution in x (i.e, 360 degress divided into this many steps)

data = LV(alpha,beta,delta,gamma,T,res);
data = data/max(max(data));

%% making everything complex with norm 1
% I have no idea why this works, but it makes the DMD code much better
data_imag = sqrt(1-data.^2);
data = data + 1i*data_imag;

%%
subplot(2,2,1);
p = pcolor(real(data));
p.EdgeColor = 'none';
colorbar
%% DMD analysis
r = 80;
[Phicol,Lambda,b] = DMD(data(:,1:end-1),data(:,2:end),r);

% Figure 2
subplot(2,2,2);
s = linspace(-1,1,1000);
p1 = plot(real(diag(Lambda)),imag(diag(Lambda)),'o', ...
    s,sqrt(1-s.^2),'-b',s,-sqrt(1-s.^2),'-b');
set(p1(1),'MarkerSize',10);
xlabel('Real part');ylabel('Imaginary part');axis equal
legend('Eigenvalues','Unit Circle');
% Figure 3
subplot(2,2,3);
for j=1:T
    ModeDynamics(:,j) = Phicol*Lambda^(j-1)*b;
end
s = pcolor(real(ModeDynamics));
s.EdgeColor = 'none';
colorbar
%% Koopman Analysis
