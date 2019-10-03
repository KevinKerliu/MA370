% MA370_Homework_2
% Kevin Kerliu
clear;
close all;
clc;
%%

% 8.2 Modified Gram-Schmidt
% See mgs.m

%%

% 10.2 Householder
% (a) See house.m
% (b) See formQ.m

%%

% 10.3

Z = [1 2 3; ...
     4 5 6; ...
     7 8 7; ...
     4 2 3; ...
     4 2 2];
 
[qrQ,qrR] = qr(Z,0);    
[mgsQ,mgsR] = mgs(Z);
[houseW,houseR] = house(Z);
houseQ = formQ(houseW); 

qrZ = qrQ*qrR;
mgsZ = mgsQ*mgsR;
houseZ = houseQ(:,1:3)*houseR;

qrAccuracy = norm(Z - qrZ)
mgsAccuracy = norm(Z - mgsZ)
houseAccuracy = norm(Z - houseZ)

% All of these are really accurate!

%%

% 11.3
format long;

m = 50;
n = 12;

t = linspace(0,1,m);

A = fliplr(vander(t));
A = A(:,1:n);
b = cos(4*t)';

% (a)
normalR = chol(A'*A);
normalX = normalR\(normalR'\(A'*b));
% (b)
[mgsQ,mgsR] = mgs(A);
mgsX = mgsR\(mgsQ'*b);
% (c)
[houseW,houseR] = house(A);
houseQ = formQ(houseW);
houseX = houseR\(houseQ(:,1:n)'*b);
% (d)
[qrQ,qrR] = qr(A);
qrX = qrR\(qrQ'*b);
% (e)
backslashX = A\b;
% (f)
[U,S,V] = svd(A,0);
svdX = V*(S\(U'*b));
% (g)
x = [normalX, mgsX, houseX, qrX, backslashX, svdX]
% (a) is clearly unstable
% (b) is better but still off
% (c) is stable
% (d) is stable
% (e) is stable
% (f) is stable