clear all;
close all;
clc

dim_bloc = 8;

I = imread('lena.tif');
image = rgb2gray(I);
image = double(image);

[m, n] = size(image);

%% Padding %% if the dimension are not multiple of 8

%fprintf('La taille du fichier non compresse est %d octets.\n', dim_img);

heighttmp = m;
widthtmp = n;
    
%% TODO: %% Padding %% if the dimension are not multiple of 8
%....



[m, n] = size(image);
dim_img = m*n; 

%% simple image illumination normalisation, optional, not written in topic 
% mi = min(min(image));
% ...
% ...


%% init
%jpeg = zeros(size(image)); 
im_decompressee = zeros(size(image));

%% pour le centrage
offset = ones(dim_bloc,dim_bloc) * 128;

DCT = dctmtx(dim_bloc);

quantizer=[16 11 10 16  24  40  51  61;
   12 12 14 19  26  58  60  55;
   14 13 16 24  40  57  69  56;
   14 17 22 29  51  87  80  62;
   18 22 37 56  68 109 103  77;
   24 35 55 64  81 104 113  92;
   49 64 78 87 103 121 120 101;
   72 92 95 98 112 100 103 99];

% quality of factor, be used to calculate quantification matrix
% by default = 50 => use the above
factorQ = 50;
% TODO

quantizer = floor((S*quantizer + 50) / 100);


zigzag = [];
% col and lig indexes will be used to form the zigzag vector
col = [1 2 1 1 2 3 4 3 2 1 1 2 3 4 5 6  5 4 3 2 1 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 8 7 6 5 4 3 4 5 6 7 8 8 7 6 5 6 7 8 8 7 8];
lig = [1 1 2 3 2 1 1 2 3 4 5 4 3 2 1 1 2 3 4 5 6 7 6 5 4 3 2 1 1 2 3 4  5 6 7 8 8 7 6 5 4 3 2 3 4 5 6 7 8 8 7 6 5 4 5 6 7 8 8 7 6 7 8 8];
 

%% codage

for i = 1:dim_bloc:m
   for j = 1:dim_bloc:n
        bloc = image(i:i+7,j:j+7);
    
        %centrage
        % TODO
        
        %DCT
        % TODO
        
        %quantification
		% TODO
        
        % zigzag of the block
		% TODO
        % see the code in "code_zigzag.m"

        % concatenate all zigzag vectors (Vrlc)
        zigzag = [zigzag zigzag_block];
        
        % Vrlc
        Vrlc = [Vrlc rlencode(zigzag_block)];
                   
    end
end

%% TODO ...
%% Huffman 
%% decodage ...
