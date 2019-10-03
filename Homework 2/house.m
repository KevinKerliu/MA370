% MA370_Homework_2
% Kevin Kerliu

% house.m
% Compute an implicit representation of a full QR factorization of 
% an m x n matrix A, where m >= n, using Householder reflections.

function [W,R] = house(A)

[m,n] = size(A);
W = zeros(m,n);
R = zeros(n,n);

for k=1:n
    x = A(k:m,k);
    v = sign(x(1))*norm(x)*eye(m-k+1,1) + x;
    v = v/norm(v);
    A(k:m,k:n) = A(k:m,k:n) - 2*v*(v'*A(k:m,k:n));
    W(k:m,k) = v;
end

R = A(1:n,:);

end