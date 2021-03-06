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
title("e1 - R�sultat du sous �chantillonage de la convolution du signal avec rh");
xlabel("Echantillons");
ylabel("Amplitude");
subplot(1,2,2);
plot(w1);
title("w1 - R�sultat du sous �chantillonage de la convolution du signal avec rg");
xlabel("Echantillons");
ylabel("Amplitude");



%% Question 2.3

e_surech = zeros(1,length(e_conv));
w_surech = zeros(1,length(e_conv));
%Insertion de z�ros
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
title("e sur�chantillon�");
subplot(1,3,2);
plot(w_surech_conv);
xlabel("Echantillons");
ylabel("Amplitude");
title("w sur�chantillon�")
subplot(1,3,3);
plot(sig2);
xlabel("Echantillons");
ylabel("Amplitude");
title("Diff�rence entre la reconstruction et le signal d'origine")

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
title("Signal reconstitu�")
subplot(1,3,3);
plot(erreur);
xlabel("Echantillons");
ylabel("Amplitude");
title("Erreur entre la reconstitution et le signal d'origine")


%% Question 3 - Ondelettes orthogonales 

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
    
    difference = x - xreconstruit;
    
figure(6);
subplot(1,3,1);
plot(x);
xlabel("Echantillons");
ylabel("Amplitude");
title("Signal initial");
subplot(1,3,2);
plot(approximation);
xlabel("Echantillons");
ylabel("Amplitude");
title("Signal Approximation obtenu � partir du Signal initial")
subplot(1,3,3);
plot(detail);
xlabel("Echantillons");
ylabel("Amplitude");
title("Signal D�tail obtenu � partir du Signal initial")
    

figure(7);
subplot(1,4,1);
plot(x);
xlabel("Echantillons");
ylabel("Amplitude");
title("Signal initial");
subplot(1,4,2);
plot(xreconstruit);
xlabel("Echantillons");
ylabel("Amplitude");
title("Signal reconstruit")
subplot(1,4,3);
plot(difference);
xlabel("Echantillons");
ylabel("Amplitude");
title("Diff�rence entre les 2 signaux (avec d�tails)")
subplot(1,4,4);
plot(x - approximationreconstruit);
xlabel("Echantillons");
ylabel("Amplitude");
title("Diff�rence entre les 2 signaux (sans d�tails)")

%% Question 3 - Ondelettes biorthogonales 


    %Longueur de 128 �chantillons
    [rh, rg, h, g] = GetFiltres('5/3');
    x = SignauxTypiques('sinusDiscontinu', 128);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    detail = DownFilter(x,rg,'d_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_o');
    detailreconstruit = UpFilter(detail,g,'d_b');
    
    %TODO
    x2 = approximationreconstruit + detailreconstruit;
    erreur = x-x2;
    
    figure(8);
    subplot(1,3,1);
    plot(x2);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Signal reconstruit")
    
    subplot(1,3,2);
    plot(erreur);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Diff�rence entre les 2 signaux (avec d�tails) pour 5/3")
    
    subplot(1,3,3);
    plot(x - detailreconstruit);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Diff�rence entre les 2 signaux (sans d�tails) pour 5/3")
    
    %Longueur de 64 �chantillons
 
    
    [rh, rg, h, g] = GetFiltres('5/3');
    x = SignauxTypiques('sinusDiscontinu', 64);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    detail = DownFilter(x,rg,'d_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_o');
    detailreconstruit = UpFilter(detail,g,'d_b');
    
    %TODO
    x2 = approximationreconstruit + detailreconstruit;
    erreur = x-x2;
    
    figure(8);
    subplot(1,3,1);
    plot(x2);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Signal reconstruit")
    
    subplot(1,3,2);
    plot(erreur);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Diff�rence entre les 2 signaux (avec d�tails) pour 5/3")
    
    subplot(1,3,3);
    plot(x - detailreconstruit);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Diff�rence entre les 2 signaux (sans d�tails) pour 5/3")

    
    %Pour 9/7
    [rh, rg, h, g] = GetFiltres('9/7');
    x = SignauxTypiques('sinusDiscontinu', 128);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    detail = DownFilter(x,rg,'d_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_b');
    detailreconstruit = UpFilter(detail,g,'d_b');
    
    %TODO
    x2 = approximationreconstruit + detailreconstruit;
    erreur = x-x2;
    
    figure(8);
    subplot(1,3,1);
    plot(x2);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Signal reconstruit")
    
    subplot(1,3,2);
    plot(erreur);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Diff�rence entre les 2 signaux (avec d�tails) pour 9/7")
    
    subplot(1,3,3);
    plot(x - detailreconstruit);
    xlabel("Echantillons");
    ylabel("Amplitude");
    title("Diff�rence entre les 2 signaux (sans d�tails) pour 9/7")
    
    %% Question 4 - Compression d'une image
    % img = double(imread('Roue.bmp'));
img = double(imread('lena.png'));
photo = img(:,:,1);
[N,L] =  size(photo);


figure(9);
subplot(1,3,1);
colormap(gray);
imagesc(photo);axis image; 
title('Originale');

photo1 = zeros(N,N);
photo2 = zeros(N,N);


% decomposition des lignes
[rh, rg, h, g] = GetFiltres('9/7');
for(i=1:N)
    ligne = photo(i,:);

    approximation = DownFilter(ligne,rh,'a_h');
    detail = DownFilter(ligne,rg,'d_b');

    photo1(i,(1:(N/2)))= approximation;
    photo1(i,((N/2)+1:end)) = detail;
end

subplot(1,3,2);
colormap(gray);
imagesc(abs(photo1));axis image; title('Decompose 1');

 
% decomposition des colonnes

for(i=1:N)
    colonne = photo1(:,i)';
	approximationc = DownFilter(colonne,rh,'a_h');
    detailc = DownFilter(colonne,rg,'d_b');
    photo2((1:(N/2)),i)= approximationc;
    photo2(((N/2)+1:end),i) = detailc;
end

subplot(1,3,3);
colormap(gray);
imagesc(abs(photo2)); axis image; title('Decompose 2');
%On obtient une photo en 4 parties

% Reconstruction de l'image (� partir de celle de photo2)

[M,N] = size(photo2);
[rh, rg, h, g] = GetFiltres('9/7');
f1= zeros(N,N);
f2 = zeros(N,N);
p1 = transpose(photo2(1:(N/2),:));
p2 = transpose(photo2((N/2)+1:end,:));

for(i=1:N)
   ligne = p1(i,:);
   f1(i,1:N)=UpFilter(ligne,h,'a_h');
end

filtre1 = transpose(f1);

for(i=1:N)
   ligne = p2(i,:);
   f2(i,1:N)=UpFilter(ligne,g,'d_b');
end

filtre2 = transpose(f2);
photo3 = filtre1 + filtre2; 

%Image en 2 parties
figure(10);
colormap(gray);
imagesc(abs(photo3));

%2�me partie

f3= zeros(N,N);
f4 = zeros(N,N);
p3 = photo3(:,1:(N/2));
p4 = photo3(:,(N/2)+1:end);

for(i=1:N)
   ligne = p3(i,:);
   f3(i,1:N)=UpFilter(ligne,h,'a_h');
end

for(i=1:N)
   ligne = p4(i,:);
   f4(i,1:N)=UpFilter(ligne,g,'d_b');
end


photo4 = f3 + f4; 
%Image reconstitu�e
figure(11);
colormap(gray);
imagesc(abs(photo4));

%Reconstruction et Compression en supprimant la composante v11
photo_abime = photo2;
for(i =((N/2)+1):N)
    for (j =((N/2)+1):N)
        photo_abime(i,j) = 0;
    end
end
    
[M,N] = size(photo_abime);
[rh, rg, h, g] = GetFiltres('9/7');
f1= zeros(N,N);
f2 = zeros(N,N);
p1 = transpose(photo_abime(1:(N/2),:));
p2 = transpose(photo_abime((N/2)+1:end,:));

for(i=1:N)
   ligne = p1(i,:);
   f1(i,1:N)=UpFilter(ligne,h,'a_h');
end

filtre1 = transpose(f1);

for(i=1:N)
   ligne = p2(i,:);
   f2(i,1:N)=UpFilter(ligne,g,'d_b');
end

filtre2 = transpose(f2);
photo3 = filtre1 + filtre2; 


f3= zeros(N,N);
f4 = zeros(N,N);
p3 = photo3(:,1:(N/2));
p4 = photo3(:,(N/2)+1:end);

for(i=1:N)
   ligne = p3(i,:);
   f3(i,1:N)=UpFilter(ligne,h,'a_h');
end

for(i=1:N)
   ligne = p4(i,:);
   f4(i,1:N)=UpFilter(ligne,g,'d_b');
end


photo5 = f3 + f4; 
%Image reconstitu�e
figure(12);
colormap(gray);
imagesc(abs(photo5));

%Calcul du PSNR
MSE = 0;
for (i=1:N)
    for (j=1:N)
        MSE = MSE + (cast(img(i,j),'double')-photo5(i,j))^2;
    end
end

MSE = MSE/(N*N);
PSNR = 10*log(255*255 /MSE);



