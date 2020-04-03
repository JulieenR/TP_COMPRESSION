%% Reconstruction

load PieceRegSig

e_recn = zeros(1, length(e)*2);
for k=1:length(e)
    e_recn(2*k) = e(k);
end

w_recn = zeros(1, length(w)*2);
for k=1:length(w)
    w_recn(2*k) = w(k);
end


sig_recn = conv(w_recn, g)+conv(e_recn, h);
% on tronque le signal pour garder seulement la partie utile.
sig_fin = sig_recn(5:1028);

figure(1);
subplot(4, 1, 1)
plot(sig)
title("signal original")
subplot(4,1,2);
plot(sig_fin);
title("signal reconstruit");
subplot(4, 1, 3);
plot(sig_fin-sig);

deltaSignal = abs(sig_fin - sig);
percentageDifference = deltaSignal ./ sig;
meanPctDiff = mean(percentageDifference);

title(['différence : ' num2str(meanPctDiff*100) ' %']);
subplot(4,1,4);
plot(sig_recn(4:1027)-sig);

deltaSignal = abs(sig_recn(4:1027) - sig);
percentageDifference = deltaSignal ./ sig;
meanPctDiff = mean(percentageDifference);

title(['différence avec signal mal tronqué : ' num2str(meanPctDiff*100) ' %']);

figure(2);
plot(e);
figure(3);
plot(w);