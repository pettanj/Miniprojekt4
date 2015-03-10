clear all;
close all;
maxi = 150;
m = 70;
while maxi <= 200

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
        W = 9.8*m;
        D = -(W/55^2)*(U(1,i)^2)*sign(U(1,i));
        B = 0;
        U(4, i+1) = 0;
        if U(3, i) >= 49
            B = -10*(U(3,i)-49);
            U(4, i+1) = 49;
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
    m = m+0.001;
    maxi = max(U(3,:));
end
m