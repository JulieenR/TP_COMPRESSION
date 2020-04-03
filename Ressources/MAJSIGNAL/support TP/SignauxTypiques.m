%===============================================================================
% TP ondelettes
% -------------------------------------------
% Fichier SignauxTypiques.m : construction de signaux typiques en TS
%
% Syntaxe d'appel
% ---------------
%   signal = SignauxTypiques (type, longueur)
%
% Param?tres
% ----------
%   - type : type de signal ? g?n?rer
%       'sinusDiscontinu' : sinusoide avec deux discontinuit?s
%       'ligneLena'       : ligne d'une image (discontinue par p?riodisation)
%   - longueur : nombre de points du signal ? construire
%                (forc? ? 256 si type = 'ligneLena')
%
% Variable de retour
% ------------------
%   - signal g?n?r? (vecteur ligne)
%===============================================================================


function signal = SignauxTypiques(type, longueur)

t = (1:longueur) ./longueur;

if  strcmp(type,'sinusDiscontinu')
    signal = 4.*sin(4*pi.*t);
	signal = signal - sign(t - .3) - sign(.72 - t);
       
elseif strcmp(type,'ligneLena')
    photo  = double(imread('lena.bmp'));
    signal = photo(175,:);
    
else
    signal = zeros(1,longueur);
end;
