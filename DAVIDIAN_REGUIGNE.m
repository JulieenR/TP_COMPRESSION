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

%% Question 2.2

load("PieceRegSig")
load("Daub4")
% Pour e

e_conv=conv(sig, rh);
e1=e_conv(1:2:length(e_conv));

%Pour w

w_conv=conv(sig, rg);
w1=w_conv(1:2:length(w_conv));

%Affichage 
figure(3)
subplot(1,2,1)
plot(e1);
title("e1 - Résultat du sous échantillonage de la convolution du signal avec rh");
xlabel("Echantillons");
ylabel("Amplitude");
subplot(1,2,2);
plot(w1);
title("w1 - Résultat du sous échantillonage de la convolution du signal avec rg");
xlabel("Echantillons");
ylabel("Amplitude");



%% Question 2.3
