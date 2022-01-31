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


%% Koopman Analysis