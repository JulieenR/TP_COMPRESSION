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

e_surech = zeros(1,length(e_conv));
w_surech = zeros(1,length(e_conv));
%Insertion de zéros
for i=1:1027
    if mod(i,2) ==1  % Si c'est impair
        e_surech(i)=e1((i+1)/2);
    else
        e_surech(i)=0;
    end
end

for i=1:1027
    if mod(i,2) ==1  % Si c'est impair
        w_surech(i)=w1((i+1)/2);
    else
        w_surech(i)=0;
    end
end

e_surech_conv = conv(e_surech,h);
w_surech_conv = conv(w_surech,g);

sig2 = e_surech_conv + w_surech_conv;
sig2 = sig2(4:length(sig2)-3);

erreur = sig - sig2;

figure(4);
subplot(1,3,1);
plot(e_surech_conv);
xlabel("Echantillons");
ylabel("Amplitude");
title("e suréchantilloné");
subplot(1,3,2);
plot(w_surech_conv);
xlabel("Echantillons");
ylabel("Amplitude");
title("w suréchantilloné")
subplot(1,3,3);
plot(sig2);
xlabel("Echantillons");
ylabel("Amplitude");
title("Différence entre la reconstruction et le signal d'origine")

figure(5);
subplot(1,3,1);
plot(sig);
xlabel("Echantillons");
ylabel("Amplitude");
title("Signal");
subplot(1,3,2);
plot(sig2);
xlabel("Echantillons");
ylabel("Amplitude");
title("Signal reconstitué")
subplot(1,3,3);
plot(erreur);
xlabel("Echantillons");
ylabel("Amplitude");
title("Erreur entre la reconstitution et le signal d'origine")


%% Question 3 - Ondelettes orthogonales %%

    [rh, rg, h, g] = GetFiltres('Haar');
    x = SignauxTypiques('ligneLena', 256);
 
    figure(6);
    plot(x);
    title('Signal initial');
    
    % pour les ondelettes orthogonales (longueur paire), utiliser type
    % ='a_o' ou 'd_o' (a: approximation, d: detail, o: orthogonales
    approximation = DownFilter(x,rh,'a_o');
    detail = DownFilter(x,rg,'d_o');

    % pour les ondelettes orthogonales (longueur paire), utiliser type
    % ='a_o' ou 'd_o' 
    approximationreconstruit = UpFilter(approximation,h,'a_o');
    detailreconstruit = UpFilter(detail,g,'d_o');
    xreconstruit = approximationreconstruit + detailreconstruit;
    

    %TODO

%% Ondelettes biorthogonales %% %% 

    [rh, rg, h, g] = GetFiltres(...);
    
    x = SignauxTypiques(...);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    detail = DownFilter(x,rg,'d_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_b');
    detailreconstruit = UpFilter(detail,g,'d_b');
    
    %TODO
