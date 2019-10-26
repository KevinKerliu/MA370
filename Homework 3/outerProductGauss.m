% MA370_Homework_3
% Kevin Kerliu

% outerProductGauss.m
% Compute an LU factorization with of an n x n matrix, A, via an outer
% product reformulation of the LU algorithm.

function [L,U] = outerProductGauss(U)

[~,m] = size(U);

% U = A; unncessary if we call our input U
L = eye(m);

for k = 1:m-1
        L(k+1:m,k) = U(k+1:m,k)/U(k,k);
        U(k+1:m,k+1:m) = U(k+1:m,k+1:m) - L(k+1:m,k)*U(k+1:m,k)';
end

end