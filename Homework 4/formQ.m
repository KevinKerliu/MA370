% MA370_Homework_2
% Kevin Kerliu

% formQ.m
% Generate a corresponding othogonal matrix, Q, given the matrix W,
% produced by house.

function Q = formQ(W)

[m,n] = size(W);
Q = eye(m,m);

for k=1:m 
    x = Q(:,k); 
    for l=n:-1:1
        x(l:m) = x(l:m) - 2*W(l:m,l)*(W(l:m,l)'*x(l:m));
    end
    Q(:,k) = x;
end

end