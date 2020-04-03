%===============================================================================
% TP ondelettes et bancs de filtres d'ordre 2
% -------------------------------------------
% Fichier UpFilter : sur?chantillonnage et filtrage 
%                    r?alise un bras du banc de synth?se
% Syntaxe d'appel
% ---------------
%   y = upFilter (x, f, type)
%
% Param?tres
% ----------
%   - x        : signal ? sur?chantillonner et filtrer
%                DOIT ?tre un vecteur ligne
%   - f        : filtre RIF de LONGUEUR IMPAIRE
%                (ajouter un coefficient 0 aux filtres de longueur paire)
%   - type     : type 'a_o', 'd_o', 'a_b' ou 'd_b': a: approximation, d:
%   detail, o: orthogonale, b: biorthogonale
%   - y        : vecteur ligne renvoy? : signal sur-?chantillonn? et filtr?
%
%===============================================================================

% Inialement propos? : M. C?rn?loup

function y = UpFilter (x, f, type)

% Quelques v?rifications d'arguments
%-----------------------------------

if strcmp(type,'a_o') decalage = 1;
elseif strcmp(type,'d_o') decalage = 1;
elseif strcmp(type,'a_b') decalage = 0;
elseif strcmp(type,'d_b') decalage = 1;
else decalage = 1;
end;


L = length(f); R = floor(L/2);
if (L ~= 2*R+1) error('Le filtre h doit avoir une longueur impaire'); end;

M = length(x); N = 2*M;
if (N <= R)     error('Le signal x doit ?tre plus long que le demi retard du filtre'); end;

% Sur?chantillonnage
%-------------------
xs = zeros(1,N); 
xs(1+decalage:2:end) = x;

% P?riodisation (pour le traitement des bords) et filtrage
%--------------------------
xp = [xs(1+R:-1:2), xs, xs(N-1:-1:N-R)];

yp = filter(f,1,xp);
y  = yp(L:end);
