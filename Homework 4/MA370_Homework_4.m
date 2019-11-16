% MA370_Homework_4
% Kevin Kerliu
clear;
close all;
clc;
%%

% 24.3 

A = randn(10) - 2*eye(10);
largest_eig = max(real(eig(A)))
spectralAbscissa(A,100);

% If the largest real eigenvalue is positive, then the matrix is
% "unstable"; it has at least one pole in the RHP and thus it tends to 
% infinity.

% If the largest real eigenvalue is negative, then the matrix is "stable";
% all its poles are in the LHP and thus it tends to zero.

% If the pole with the largest real eigenvalue is real, then the matrix
% does not exhibit oscillatory behavior as it tends to zero or infinity.

% If the pole with the largest real eigenvalue is complex, then the matrix
% exhibits oscillatory behavior as it tends to zero or infinity.

%%

% 26.2

N = 32;
v = ones(1,32);
A = diag(-1*v) + diag(v(1:31),1) + diag(v(1:30),2);

% (a)

eigtool(A);

% (b)

spectralAbscissa(A,50);

% The curve grows extemely quickly, peaks, and then tends to zero.
% This is due to pertubations in the eigenvalues when computing them with
% finite precision (the psuedospectum).

%%

% 29.1

m1 = 4;
A1 = hilb(m1);
[eigA1] = driver(A1,m1)
[eigA1withShifts] = driverWithShifts(A1,m1)

m2 = 15;
A2 = diag(m2:-1:1) + ones(m2,m2);
[eigA2] = driver(A2,m2)
[eigA2withShifts] = driverWithShifts(A2,m2)

% It is meaningful to speak of a certain "number of QR iterations per
% eigenvalue" because for a very large system, you can then approximate how
% long it might take to calculate the i-th eigenvalue, and potentially
% decide how many you will calculate, for example (if you do not need 
% all of them).
