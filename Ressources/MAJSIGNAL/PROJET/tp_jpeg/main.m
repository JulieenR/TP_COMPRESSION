clearvars
close all

% Lecture image

img = double(imread("lena.bmp"));

% Conversion en blocs

img2 = blocs(img);

% Centrage 

img3 = centrage(img2);

% DCT

img4 = dctblocs(img3,8);

for i=1:64:1024
    %figure(i);
    %imagesc(img4(:,:,i))
end

% Quantification

% quantmat créé une matrice de quantification
% L'argument est le facteur de qualité (entre 1 et 100), mettre -1 pour la
% matrice par défaut.

q = quantmat(-1);

img5 = quant(img4,q);

for i=1:64:1024
    %figure(i);
    %imagesc(img5(:,:,i))
end


img6 = encoding_zigzag(img5);


img7 = encoding_rlc(img6);


[img8, ydico] = huffman(img7);


decimg7 = decode_huffman(img8, ydico);

decimg6 = decode_rlc(decimg7);

decimg5 = decode_zigzag(decimg6);

decimg45 = dequantifier(decimg5, q);

decimg4 = decode_dct(decimg45);

decimg3 = decentrage(decimg4);

decimg2 = deblocs(decimg3);

figure(1);
imshow(int8(transpose(decimg2)));
figure(2);
imshow(int8(img))

