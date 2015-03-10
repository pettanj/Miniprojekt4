clear all;
close all;

U(1, 1) = 0; % init Distance
U(2, 1) = 0; % init Speed
[Tout, Yout] = ode45(@odefunc, [0 50], U);

figure;
plot(Tout, Yout);
legend('Distance', 'Speed');