%% Convolution

load PieceRegSig
load Daub4;

e_conv = conv(sig, rh);
e=e_conv(1:2:length(e_conv));

w_conv = conv(sig, rg);
w = w_conv(1:2:length(w_conv));

figure(3);
subplot(2,1,1)
plot(e)
title("approximation");
subplot(2,1,2)
plot(w)
title("détails");

% discontinuitées observées au bord de e et w. On convolue avec des valeurs
% fausses aux extrémitées puisqu'il n'y a plus de valeurs.
