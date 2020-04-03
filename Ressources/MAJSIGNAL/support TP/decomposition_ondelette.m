%%%% Décomposition en ondelettes et reconstruction parfaite

clear;

load PieceRegSig;
lenSig = length(sig);

figure(1);
plot(sig);
title('signal PieceRegSig');

%% Première décomposition dans la base de Haar

e=zeros(1,lenSig/2);
for k=1:(lenSig/2)
    e(k) = (sig(2*k-1)+sig(2*k))/2;
end

w=zeros(1,lenSig/2);
for k=1:(lenSig/2)
    w(k) = (sig(2*k)-sig(2*k-1))/2;
end

figure(3);
plot(e);
title('approximation');

figure(2);
plot(w);
title('details');































    