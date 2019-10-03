% MA370_Homework_2
% Kevin Kerliu

% mgs.m
% Compute a reduced QR factorization of an m x n matrix A, where m >= n

function [Q,R] = mgs(Q)

% Originally had [Q,R] = msg(A), but this formulation saves more space

[~,n] = size(Q);
% Q = zeros(m,n);
R = zeros(n,n);

% for i=1:n
% Q(:,i) = A(:,i);
% end

for i=1:n
    R(i,i) = norm(Q(:,i));
    Q(:,i) = Q(:,i)/R(i,i);
    for j = i+1:n
        R(i,j) = Q(:,i)'*Q(:,j);
        Q(:,j) = Q(:,j) - R(i,j)*Q(:,i);
    end
end

end