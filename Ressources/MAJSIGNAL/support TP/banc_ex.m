close all;
clear all;                                                                 
clc;

%% Ondelettes orthogonales %%

    [rh, rg, h, g] = GetFiltres("Haar");
    x = SignauxTypiques("ligneLena", 1024);
 
    figure;
    plot(x);
    title('Signal initial');
    
    % pour les ondelettes orthogonales (longueur paire), utiliser type
    % ='a_o' ou 'd_o' (a: approximation, d: detail, o: orthogonales
    approximation = DownFilter(x,rh,'a_o');
    detail = DownFilter(x,rg,'d_o');

    % pour les ondelettes orthogonales (longueur paire), utiliser type
    % ='a_o' ou 'd_o' 
    approximationreconstruit = UpFilter(approximation,h,'a_o');
    detailreconstruit = UpFilter(detail,g,'d_o');
    
    figure(1);
    subplot(3,1,1)
    plot(x);
    title("signal")
    subplot(3,1,2)
    plot(approximationreconstruit+detailreconstruit)
    title("signal reconstruit")
    subplot(3,1,3)
    plot(x-(approximationreconstruit+detailreconstruit))
    
    deltaSignal1 = abs(x-(approximationreconstruit+detailreconstruit));
    percentageDifference1 = deltaSignal1 ./ x;
    meanPctDiff1 = mean(percentageDifference1);

    title(['difference : ', num2str(meanPctDiff1*100), ' %'])
    sgtitle('décomposition de Haar pour ligneLena')
    

%% Ondelettes biorthogonales 5/3 %% 

    [rh, rg, h, g] = GetFiltres("5/3");
    
    x = SignauxTypiques("ligneLena", 1024);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    detail = DownFilter(x,rg,'d_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_b');
    detailreconstruit = UpFilter(detail,g,'d_b');
    
    figure(2);
    subplot(3,1,1)
    plot(x);
    title("signal")
    subplot(3,1,2)
    plot(approximationreconstruit+detailreconstruit)
    title("signal reconstruit")
    subplot(3,1,3)
    plot(x-(approximationreconstruit+detailreconstruit))
    
    deltaSignal2 = abs(x-(approximationreconstruit+detailreconstruit));
    percentageDifference2 = deltaSignal2 ./ x;
    meanPctDiff2 = mean(percentageDifference2);

    title(['difference : ', num2str(meanPctDiff2*100), ' %'])
    
    sgtitle('décomposition biorthogonale 5/3 pour ligneLena')
    
    
%% reconstruction brutale

    [rh, ~, h, ~] = GetFiltres("5/3");
    
    x = SignauxTypiques("ligneLena", 1024);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_b');
    
    figure(3);
    subplot(3,1,1)
    plot(x);
    title("signal")
    subplot(3,1,2)
    plot(approximationreconstruit)
    title("signal reconstruit")
    subplot(3,1,3)
    plot(x-approximationreconstruit)
    
    deltaSignal3 = abs(x-approximationreconstruit);
    percentageDifference3 = deltaSignal3 ./ x;
    meanPctDiff3 = mean(percentageDifference3);

    title(['difference : ', num2str(meanPctDiff3*100), ' %'])
    
    sgtitle('reconstruction brutale biorthogonale 5/3 pour ligneLena')

%% Ondelettes biorthogonales 9/3 %% %% 

    [rh, rg, h, g] = GetFiltres("9/7");
    
    x = SignauxTypiques("ligneLena", 1024);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    detail = DownFilter(x,rg,'d_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_b');
    detailreconstruit = UpFilter(detail,g,'d_b');
    
    figure(4);
    subplot(3,1,1)
    plot(x);
    title("signal")
    subplot(3,1,2)
    plot(approximationreconstruit+detailreconstruit)
    title("signal reconstruit")
    subplot(3,1,3)
    plot(x-(approximationreconstruit+detailreconstruit))
    
    deltaSignal4 = abs(x-(approximationreconstruit+detailreconstruit));
    percentageDifference4 = deltaSignal4 ./ x;
    meanPctDiff4 = mean(percentageDifference4);

    title(['difference : ', num2str(meanPctDiff4*100), ' %'])
    
    sgtitle('décomposition biorthogonale 9/7 pour ligneLena')












