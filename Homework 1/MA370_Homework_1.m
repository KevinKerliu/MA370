% MA370_Homework_1
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

A = imread('peppers.png'); %import image
A = A(:,:,1); %convert to grayscale
A = im2double(A); %convert to double precision
figure;
imshow(A);

% Just playing around!
Atranspose = transpose(A);
figure;
imshow(Atranspose);

k = .7;
Ascaled = k*A;
figure;
imshow(Ascaled);
%%

[U,S,V] = svd(A);

% kth rank approx. of A
% Ak = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';

% Rank 1 Approx., this decomp. would be useless
A1 = U(:,1)*S(1,1)*V(:,1)';
figure;
imshow(A1);

% Rank 20 Approx., we start to see the image
A20 = U(:,1:20)*S(1:20,1:20)*V(:,1:20)';
figure;
imshow(A20);

% Rank 50 Approx., the image is a lot clearer
A50 = U(:,1:50)*S(1:50,1:50)*V(:,1:50)';
figure;
imshow(A50);

% Rank 100 Approx., almost all the granularity is gone and the image looks
% nearly the same as the original, even though the full rank of the image 
% is 384!
A100 = U(:,1:100)*S(1:100,1:100)*V(:,1:100)';
figure;
imshow(A100);

%%

B = imread('favoritePicture.jpg'); %import image
B = B(:,:,1); %convert to grayscale
B = im2double(B); %convert to double precision
figure;
imshow(B);

[U_B, S_B, V_B] = svd(B);

% kth rank approx. of B
% Bk = U_B(:,1:k)*S_B(1:k,1:k)*V_B(:,1:k)';

% Very blurry
B25 = U_B(:,1:25)*S_B(1:25,1:25)*V_B(:,1:25)';
figure;
imshow(B25);

% Significant improvement 
B50 = U_B(:,1:50)*S_B(1:50,1:50)*V_B(:,1:50)';
figure;
imshow(B50);

% Much better details
B75 = U_B(:,1:75)*S_B(1:75,1:75)*V_B(:,1:75)';
figure;
imshow(B75);

% Not as much improvement as from rank 50 to rank 75
B100 = U_B(:,1:100)*S_B(1:100,1:100)*V_B(:,1:100)';
figure;
imshow(B100);