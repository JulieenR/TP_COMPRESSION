% R�alisation d'un encodeur / d�codeur JPEG  simplifi�


clearvars
close all

%Lecture de l'image
image_origine = double(imread("lena.bmp"));

%On d�compose l'image en bloc de 8x8. Pour une image de 256*256, on aura
%1024 blocs de 8x8

image_redimensionnee = bloc(image_origine);
[Mbis,Nbis] = size (image_redimensionnee);


% 2.1 : Centrage 

image_centree = centrage(image_redimensionnee);

% 2.2 : Transform�e en cosinus sur chaque bloc 8x8 de l'image

image_dct = dct(image_centree);

for i=1:128:1024
   % figure(i);
    %imagesc(image_dct(:,:,i))
end

%2.3  : Cr�ation d'une matrice Q
% -1 pour la matrice Q par d�faut pour RGB
% Entre 1 et 100 pour le seuil

Q = genMatQ(-1);

%Calcul
image_q = calcQuantification(image_dct,Q);

%2.4 : Codage du ZigZag
image_zigzag = code_zigzag(image_q);

image_rlc = code_rlc(image_zigzag);

[img_compressee, dictionnaire] = huffman(image_rlc);

% 3 D�codage d'un Data Unit
% On effectue l'op�ration inverse

%Decodage du code d'Huffman
%On utilise le m�me dictionnaire
image_decodee_huffman = decode_huffman(img_compressee, dictionnaire);

image_decodee_rlc = decode_rlc(image_decodee_huffman);

image_decodee_zigzag = decode_zigzag(image_decodee_rlc);

image_dequantifiee = dequantifier(image_decodee_zigzag, Q);

image_inv_dct = decode_dct(image_dequantifiee);

image_decentree = decentrage(image_inv_dct);

image_decompressee = deblocs(image_decentree);

figure(1);
imshow(int8(transpose(image_decompressee)));
figure(2);
imshow(int8(image_origine))

