%%Question 2.1

clear all;
close all;
load PieceRegSig;
n = length(sig)
I = [1:2:n];
J = [2:2:n];
e = (sig(I)+sig(J))/2;
figure(1);
plot(sig);
figure(2);
subplot(1,2,1);plot(e);
w = (sig(J)-sig(I))/2;
%figure(3);
subplot(1,2,2);plot(w);

<<<<<<< HEAD
%% Question 2.2

load("PieceRegSig")
load("Daub4")
=======
%% Question
>>>>>>> 90962174e7904c9f310cfac4f95a13c49ab08b33
