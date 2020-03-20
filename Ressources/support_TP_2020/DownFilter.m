%===============================================================================
% TP ondelettes
% -------------------------------------------
% Fichier DownFilter : filtrage et compression
%                      r?alise un bras du banc d'analyse
% Syntaxe d'appel
% ---------------
%   y = downFilter (x, h, type)
%
% Param?tres
% ----------
%   - x        : signal ? filtrer DE LONGUEUR PAIRE
%                DOIT ?tre un vecteur ligne de longueur > retard du filtre
%   - h        : filtre RIF de LONGUEUR IMPAIRE
%                (ajouter un coefficient 0 aux filtres de longueur paire)
%   - type     : type 'a_o', 'd_o', 'a_b' ou 'd_b': a: approximation, d:
%   detail, o: orthogonale, b: biorthogonale
%   - y        : vecteur ligne renvoy? : signal filtr? et sous-?chantillonn?
%
%===============================================================================

% Inialement propos? : M. C?rn?loup 
% modifié: S. Vu
function y = DownFilter (x, h, type)


% Quelques v?rifications d'arguments
%-----------------------------------

if strcmp(type,'a_o') decalage = 0;
elseif strcmp(type,'d_o') decalage = 0;
elseif strcmp(type,'a_b') decalage = 0;
elseif strcmp(type,'d_b') decalage = 1;
else decalage = 1;
end;

    
L = length(h); R = floor(L/2);
if (L ~= 2*R+1) error('Le filtre h doit avoir une longueur impaire'); end;

N = length(x); M = floor(N/2);
if (N ~= 2*M)   error('Le signal x doit avoir une longueur paire'); end;
if (N <= R)     error('Le signal x doit ?tre plus long que le retard du filtre'); end;

% P?riodisation (pour le traitement des bords) et filtrage
%--------------------------
xp = [x(1+R:-1:2), x, x(N-1:-1:N-R)];
yp = filter(h,1,xp);

% Compression
%------------
y  = yp(L+decalage:2:end);



% whos yp
% figure; plot(yp)
% title('y conv');

% whos y
% figure; plot(y)
% title('y comp');
