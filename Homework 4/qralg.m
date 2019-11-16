function [T,t] = qralg(T)

while_threshold = 10e-12;
error_threshold = 10e-14; % Optional
[~,m] = size(T);

t = [];
while (abs(T(m,m-1)) > while_threshold)  
%    [Q,R] = qr(T);
    [W,R] = house(T);
    Q = formQ(W);
    T = R*Q;
    T(abs(T) < error_threshold) = 0; % Optional
    t = [t abs(T(m,m-1))];
end

end

