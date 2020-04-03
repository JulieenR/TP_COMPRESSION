%% Réalisation d'un encodeur / décodeur JPEG  simplifié

%% Encodage d'un data unit
% On rajoute des lignes et des colonnes sur l'image d'origine si ce n'est
% pas un multiple de 8.

%image de taille M x N
M =10;
N =16;
image_origine = zeros(M,N)

nb_lignes = mod(8- mod(M,8),8);
nb_colonnes =mod(8-  mod(N,8),8);

ligne_ajoute = image_origine(M,:);







colonne_ajoute = image_origine(:,N);
image_redimensionnee = image_origine;
for(i=1:nb_lignes)
    image_redimensionnee = [image_redimensionnee;ligne_ajoute];
end

for(i=1:nb_colonnes)
    image_redimensionnee = [image_redimensionnee,colonne_ajoute];
end

[Mbis,Nbis] = size (image_redimensionnee);

% 2.1 : Centrage 
image_centree = image_redimensionnee -128;

% 2.2 : Transformée en cosinus sur chaque bloc 8x8 de l'image

nb_bloc_ligne = Mbis /8;
nb_bloc_colonne = Nbis /8;
for(i=1:nb_bloc_ligne)
    for(j=1:nb_bloc_colonne)
        bloc = image_centree(1+ 8*(i-1):8*i,1+ 8*(j-1):8*j);
        dct_bloc = dctmtx(8) * bloc * dctmtx(8)';
        disp(dct_bloc);
    end
end

