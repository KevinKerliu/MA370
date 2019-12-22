% MA370_Homework_5
% Kevin Kerliu and Aziza Almanakly
clear;
close all;
clc;
%%

% 34.3

% Construct the bidiagonal matrix
N = 64;
A = zeros(N);
for k=1:N
    A(k,k) = k^(-1/2);
    A(k,k+1) = k^(-1/2);
end
A = A(:,1:N);

%%
% (a)

eigtool(A)

%%
% (b)

n = 30;
ritz = zeros(n); 
eigA = eigs(A,n);  

 for j = 1:n
    [Hj, ~] = Arnoldi(A);
    ritz(j,1:j) = eigs(Hj,j); 
    ritz(j,1:j) = ritz(j,1:j);
    
    figure;
    plot(real(eigA),imag(eigA),'x')
    hold on;
    plot(real(ritz(j,1:j)),imag(ritz(j,1:j)),'o');
    title(['Iteration: ', num2str(j)]);
    
    pause;
    close;
 end 

%%
% (c)

n1 = 5;
[Hn5, ~] = Arnoldi(A,n1);
eigtool(Hn5)

n2 = 10;
[Hn10, ~] = Arnoldi(A,n2);
eigtool(Hn10)

n3 = 15;
[Hn15, ~] = Arnoldi(A,n3);
eigtool(Hn15)

n4 = 20;
[Hn20, ~] = Arnoldi(A,n4);
eigtool(Hn20)