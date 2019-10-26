% MA370_Homework_3
% Kevin Kerliu

% GaussPP.m
% Compute an LU factorization with partial pivoting of an n x n matrix, A.

function [P,L,U] = GaussPP(U)

[~,m] = size(U);

% U = A; unncessary if we call our input U
L = eye(m);
P = eye(m);

for k = 1:m-1
    [~,i] = max(abs(U(k:m,k)));
    i = i+k-1;
    if i ~= k
        U([k i],k:m) = U([i k],k:m);
        L([k i],1:k-1) = L([i k],1:k-1);
        P([k i],:) = P([i k],:);
    end
    for j = k+1:m
        L(j,k) = U(j,k)/U(k,k);
        U(j,k:m) = U(j,k:m) - L(j,k)*U(k,k:m);
    end
end
    
end