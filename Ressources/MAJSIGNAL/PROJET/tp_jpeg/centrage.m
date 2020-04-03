% Etape nécessaire car transformée en cos après : On centre pour éviter
% d'avoir une composante continue parasite.

function [y] = centrage(x)
    y = x - 128;
end