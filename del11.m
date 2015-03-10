clear all;
close all;

m = 70;
U(1, 1) = 0; % x'
U(2, 1) = 0; % x''
U(3, 1) = 0; % x
U(4, 1) = 0; % debug150
U(5, 1) = 0; % W / m
U(6, 1) = 0; % D / m
U(7, 1) = 0; % B / m
antalsteg = 100000;
maxtid = 50;
h = maxtid/antalsteg;
for i = 1:antalsteg
    W = 686;
    D = -0.227*(U(1,i)^2)*sign(U(1,i));
    B = 0;
    U(4, i+1) = 150;
    if U(3, i) >= 150
        B = -10*(U(3,i)-150);
    end
    U(5,i+1) = W/m;
    U(6,i+1) = D/m;
    U(7,i+1) = B/m;
    
     
    %acc
    U(2, i+1) = (U(5,i+1)+U(6,i+1)+U(7,i+1));
    %fart
    U(1, i+1) = U(1, i) + h*U(2, i);   
    %dist
    U(3, i+1) = U(3,i) + h*U(1, i);
end

figure;
x=linspace(0, maxtid, antalsteg+1);

plot(x, U(1:4,:));
xlabel('Tid (s)')

legend('Speed(m/s)', 'Acceleration(m/s²)', 'Distance(m)', '150m');