function [eigA] = driverWithShifts(A,m)

eigA = zeros(m,1);
T = tridiag(A);
y = [];

for i = m:-1:2
    
[Tnew,t] = qralgWithShifts(T);
eigA(i) = Tnew(i,i);
y = [y t];
T = Tnew(1:i-1,1:i-1);

end

eigA(1) = T(1,1);

figure;
semilogy(y);

end

