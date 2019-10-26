% MA370_Homework_3
% Kevin Kerliu
clear;
close all;
clc;
%%

% See GaussPP.m

%%

% Solve Ax=b using GaussPP
A = [2,1,5,1; ...
     3,2,11,1; ...
     2,8,7,3; ...
     7,4,4,2];
b = [1,2,3,4]';

[P,L,U] = GaussPP(A);

x = U\(L\(P*b));

% Print P, L, U, x
P
L
U
x