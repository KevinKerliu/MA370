function A = tridiag(A)

threshold = 10e-12;

[~,m] = size(A);
% W = zeros(m,m); % If you want to save the HH reflectors

for k = 1:m-2
    x = A(k+1:m,k);
    v = sign(x(1))*norm(x)*eye(m-k,1) + x;
    v = v/norm(v);
    A(k+1:m,k:m) = A(k+1:m,k:m) - 2*v*(v'*A(k+1:m,k:m));
    A(1:m,k+1:m) = A(1:m,k+1:m) - 2*(A(1:m,k+1:m)*v)*v';
    % W(k+1:m,k) = v; % If you want to save the HH reflectors
end

A(abs(A) < threshold) = 0;

end

