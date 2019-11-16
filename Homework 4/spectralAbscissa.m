function [] = spectralAbscissa(A,tf)

N = 1000;
t = linspace(0,tf,N);

norm_exp_tA = zeros(N);
for i = 1:N
norm_exp_tA(i) = norm(expm(t(i)*A),2);
end

alphaA = max(real(eig(A)));
line = exp(t*alphaA);

figure;
semilogy(t,norm_exp_tA);
hold on 
semilogy(t,line);

end