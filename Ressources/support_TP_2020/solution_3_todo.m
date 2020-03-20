close all;
clear all;                                                                 
clc;

%% Ondelettes orthogonales %%

    [rh, rg, h, g] = GetFiltres(...);
    x = SignauxTypiques(...);
 
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

    %TODO

%% Ondelettes biorthogonales %% %% 

    [rh, rg, h, g] = GetFiltres(...);
    
    x = SignauxTypiques(...);
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximation = DownFilter(x,rh,'a_b');
    detail = DownFilter(x,rg,'d_b');
    
    % pour les ondelettes biorthogonales (longueur impaire), 
    % utiliser type='a_b' ou 'd_b' (a: approximation, d: detail, b: biorthogonales
    approximationreconstruit = UpFilter(approximation,h,'a_b');
    detailreconstruit = UpFilter(detail,g,'d_b');
    
    %TODO

