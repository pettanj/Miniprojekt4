clear all;
close all;
%u2 = 
%u2prim = (686 - 0.227 * u2^2)/70;
%v2prim = (686-0.227 * v2^2 - 10*(u1 - 150))/70;
%U = zeros(2, 101);
m = 70;
U(1, 1) = 0; % x'
U(2, 1) = 0; % x''
U(3, 1) = 0; % x
U(4, 1) = 0; % debug150
U(5, 1) = 0; % W / m
U(6, 1) = 0; % D / m
U(7, 1) = 0; % B / m
antalsteg = 100000;
maxtid = 30;
h = maxtid/antalsteg;
for i = 1:antalsteg
    W = 686;
    D = -0.227*(U(1,i)^2)*sign(U(1,i));
    B = 0;
    U(4, i+1) = 0;
    if U(3, i) >= 150
        B = -10*(U(3,i)-150);
        U(4, i+1) = 150;
    end
    U(5,i+1) = W/m;
    U(6,i+1) = D/m;
    U(7,i+1) = B/m;
    
     
    %acc
    U(2, i+1) = U(2, i) + h*(U(5,i+1)+U(6,i+1)+U(7,i+1));
    %fart
    U(1, i+1) = U(1, i) + h*U(2, i);   
    %dist
    U(3, i+1) = U(3,i) + h*U(1, i);
end
%U(3,:) = cumsum(U(3,:));
figure;
x=linspace(0, maxtid, antalsteg+1);
plot(x, U(:,:));
legend('Speed', 'Acceleration', 'Distance', 'debug', 'W/m', 'D/m', 'B/m');