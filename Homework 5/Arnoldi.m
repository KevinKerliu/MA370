function [H, Q] = Arnoldi(A)

m = length(A);
b = randn(m,1);
q1 = b/norm(b);
Q = zeros(m); 
Q(:,1) = q1;
H = zeros(m);

for n=1:m
    v = A*Q(:,n);
    for j=1:n
        H(j,n) = Q(:,j)'*v;
        v = v - H(j,n)*Q(:,j);
    end
    if n < m
       H(n+1,n) = norm(v);
       if H(n+1,n) == 0 %stopping condition
           return
       end
       Q(:,n+1) = v/norm(v);
   end
end
end