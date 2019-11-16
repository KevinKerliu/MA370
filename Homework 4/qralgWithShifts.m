function [T,t] = qralgWithShifts(T)

while_threshold = 10e-12;
[~,m] = size(T);

t = [];
while (abs(T(m,m-1)) > while_threshold)  
    B = T(m-1:m,m-1:m);
	mu = wilkinsonShift(B);
    C = mu*eye(m,m);
%     [Q,R] = qr(T - C);
    [W,R] = house(T - C);
    Q = formQ(W);
    T = R*Q + C;
    t = [t abs(T(m,m-1))];
end

end

