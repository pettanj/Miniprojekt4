clear all;
close all;


U(1, 1) = 0; % x'
U(2, 1) = 0; % x
[Tout, Yout] = ode45(@odefunc, [0 50], U);

figure;
%x=linspace(0, maxtid, antalsteg+1);
plot(Tout, Yout);
legend('Distance', 'Speed');