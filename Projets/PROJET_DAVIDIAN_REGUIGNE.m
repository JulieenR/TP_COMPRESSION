% Réalisation d'un encodeur / décodeur JPEG  simplifié


clearvars
close all

%Lecture de l'image
img = double(imread("lena.bmp"));

%On décompose l'image en bloc de 8x8. Pour une image de 256*256, on aura
%1024 blocs de 8x8

image_redimensionnee = bloc(img);
[Mbis,Nbis] = size (image_redimensionnee);


% 2.1 : Centrage 

image_centree = centrage(image_redimensionnee);

% 2.2 : Transformée en cosinus sur chaque bloc 8x8 de l'image

image_dct = dct(image_centree);

for i=1:128:1024
   % figure(i);
    %imagesc(image_dct(:,:,i))
end

%2.3  : Création d'une matrice Q
% -1 pour la matrice Q par défaut pour RGB
% Entre 1 et 100 pour le seuil

Q = genMatQ(-1);

%
image_q = calcQuantification(image_dct,Q);