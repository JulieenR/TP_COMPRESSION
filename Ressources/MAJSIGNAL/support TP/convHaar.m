echo on;% L'operateur de convolution sert aussi au produits de polynomes,% ces derniers etant representes par puissances decroissantes.% regardons un exemplea = [1 2]; % correspond au polynome A(x) = x+2b = [1 0]; % correspond au polynome B(x) = xconv(a,b)% resultat: x^2 + 2x (+0) = AB(x)echo offpausedisp('--------------------------------------------')echo on;% commencons a travailler avec 'PiecePolySig'.load PiecePolySig;% et faisons la decomposition sur la base de Haar 'a la main'% sans toutefois sous-échantillonner, c'est-a-dire qu'on garde les resultats% pour les indices pairs et inpairs:n = length(sig);e = [sig(1) (sig(2:n)+sig(1:n-1)) sig(n)]/2; % sig(1) et sig(n) au bord provientw = [sig(1) (sig(2:n)-sig(1:n-1)) -sig(n)]/2; % de la prolongation de sig par zeroecho offpausedisp('--------------------------------------------')echo on;% utilisons maintenant des convolutionsec = conv(sig,[0.5 0.5]); % ecrivez les formules de convolution sur un papier pourwc = conv(sig,[0.5 -0.5]); % verifier qu'elles correspondent aux memes operationsecho offpausedisp('--------------------------------------------')echo on;% et tracons la difference pour verifier numeriquement qu'il n'y a pas d'erreurfigure(1);plot(e-ec);figure(2);plot(w-wc);echo offpausedisp('--------------------------------------------')echo on;% refaisons le calcul 'a la main',% mais cette fois avec sous-echantillonnageI = [1:2:n];J = [2:2:n];e = (sig(I)+sig(J))/2;w = (sig(J)-sig(I))/2;echo offpausedisp('--------------------------------------------')echo on;% et sous-echantillonnons le resultat de nos convolutions.ec = ec(2:2:length(ec)); % la premiere valeur sig(1) dans ec n'est pas unewc = wc(2:2:length(wc)); % moyenne et ne fait donc pas partie de e; idem pour wcecho offpausedisp('--------------------------------------------')echo on;% d'apr?s le cours (et aussi le bon sens), les deux doivent etre egaux.% Tracons les differences:figure(1);plot(e-ec);figure(2);plot(w-wc);echo off