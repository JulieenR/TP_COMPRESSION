close all;
clear all;
clc;
% img = double(imread('Roue.bmp'));
img = double(imread('lena.png'));
photo = img(:,:,1);
[N,L] =  size(photo);


figure;
subplot(1,3,1);
colormap(gray);
imagesc(photo);axis image; 
title('Originale');

photo1 = zeros(N,N);
photo2 = zeros(N,N);
photo3 = zeros(N,N);

%% decomposition des lignes
[rh, rg, h, g] = GetFiltres('5/3');
for(i=1:N)
    ligne = photo(i,:);

    approximation = DownFilter(ligne,rh,0);
    detail = DownFilter(ligne,rg,1);

    photo1(i,(1:(N/2)))= approximation;
    photo1(i,((N/2)+1:end)) = detail;
end

subplot(1,3,2);
colormap(gray);
imagesc(abs(photo1));axis image; title('Decompose 1');

 
%% decomposition des colonne

for(i=1:N)
    colonne = photo1(:,i)';
	%%TODO....
	%%
end

subplot(1,3,3);
colormap(gray);
imagesc(abs(photo2)); axis image; title('Decompose 2');

%%TODO...
