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

