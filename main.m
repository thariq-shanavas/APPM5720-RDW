% Author - Thariq Shanavas
% thariq.shanavas@colorado.edu
clear; clf; close all;
addpath('./optdmd');
%% Generating data using Lotka-Volterra Equations

% Data parameters
T = 1000;   %Time in seconds
res = 360;  %Resolution in theta (i.e, 360 degress divided into this many steps)

% number of eigenmodes for DMD
r = 50; % Try 80 if you have a fast computer. Lower this if your computer is slow-ish.
noise = 0;  %Add some noise by setting this to 0.1
%Size of the wavefront in degrees
wave_width = 30; % Try a narrower wave at 10 degrees



% Volterra equation parameters
alpha = 0.07;
beta = 0.13;
delta = 0.10;
gamma = 0.05;



[data,centers] = LV(alpha,beta,delta,gamma,T,res,wave_width,noise);
ts = linspace(0,T-1,T);

%%

figure()
subplot(2,2,1);
p = pcolor(real(data));
p.EdgeColor = 'none';
colorbar
title('Rotating detonation waves using Lotka-Volterra eqs');
%% DMD analysis


[Phicol,Lambda,b] = DMD(data(:,1:end-1),data(:,2:end),r);
for j=1:T
    ModeDynamics(:,j) = Phicol*Lambda^(j-1)*b;
end

% Figure 2
subplot(2,2,2);
s = linspace(-1,1,1000);
p1 = plot(real(diag(Lambda)),imag(diag(Lambda)),'o', ...
    s,sqrt(1-s.^2),'-b',s,-sqrt(1-s.^2),'-b');
set(p1(1),'MarkerSize',10);
xlabel('Real part');ylabel('Imaginary part');axis equal
legend('Eigenvalues','Unit Circle');
title('Eigenvalues of DMD (book version)')

% Figure 3
subplot(2,2,3);
s = pcolor(real(ModeDynamics));
s.EdgeColor = 'none';
colorbar
title('Reconstructed data using DMD (book version)');

% Figure 4 - Using optDMD library
subplot(2,2,4);
[w,Lambda,b] = optdmd(data,ts,r,2);
ModeDynamics = w*diag(b)*exp(Lambda*ts);
s = pcolor(real(ModeDynamics));
s.EdgeColor = 'none';
colorbar
title('Reconstructed data using optdmd');
