function Z  = odefunc(~, U)
m = 70;
W = 686;
D = -0.227*(U(2)^2)*sign(U(2));
B = 0;

if U(1) >= 150
        B = -10*(U(1)-150);
end
Z = ones(2,1);
Z(1) = U(2); %velocity
Z(2) = (W+D+B)/m; %acc
end

