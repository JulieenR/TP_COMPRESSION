%% Ondelettes biorthogonales 5/3 %% 

[rh, rg, h, g] = GetFiltres("Haar");
app = 'a_o';
det = 'd_o';
double = 1;
mat = imread("lena.png");
    
newmat = zeros(size(mat));
    
for k=1:size(mat)

    x=mat(k, 1:size(mat));

    v0 = DownFilter(x,rh,app');
    v1 = DownFilter(x,rg,det);

    newmat(k, 1:size(mat)) = [v0,v1];

end

for k=1:size(newmat)

    x=newmat(1:size(newmat), k);
    x=transpose(x);

    v00 = DownFilter(x,rh,app);
    v11 = DownFilter(x,rg,det);

    newmat(1:size(mat), k)=[v00, v11];

end
if (rem(size(mat),4) == 0 & double == 1)
    mat_quart = newmat(1:size(mat)/2, 1:size(mat)/2);
    newmat_quart = zeros(size(mat_quart));

    for k=1:size(mat_quart)

        x=mat_quart(k, 1:size(mat_quart));

        v0 = DownFilter(x,rh,app);
        v1 = DownFilter(x,rg,det);

        newmat_quart(k, 1:size(mat_quart)) = [v0,v1];

    end

    for k=1:size(newmat_quart)

        x=newmat_quart(1:size(newmat_quart), k);
        x=transpose(x);

        v00 = DownFilter(x,rh,app);
        v11 = DownFilter(x,rg,det);

        newmat_quart(1:size(mat_quart), k)=[v00,v11];

    end

    newmat(1:size(mat)/2, 1:size(mat)/2) = newmat_quart;
end
    
figure(3)
imagesc(newmat); axis image; colormap(gray)
    


%% reconstruction 

if (rem(size(mat),4) == 0 & double == 1)
    matreconstruit_quart = zeros(size(mat_quart));

    for k=1:size(newmat_quart)

        x=newmat_quart(k, 1:size(newmat_quart));

        v0 = UpFilter(x(1:length(x)/2),h,app);
        v1 = UpFilter(x((length(x)/2+1):length(x)),g,det);

        matreconstruit_quart(k, 1:size(newmat_quart)) = v0+v1;

    end

    for k=1:size(matreconstruit_quart)

        x=matreconstruit_quart(1:size(newmat_quart), k);
        x=transpose(x);

        v00 = UpFilter(x(1:length(x)/2),h,app);
        v11 = UpFilter(x((length(x)/2+1):length(x)),g,det);

        matreconstruit_quart(1:size(newmat_quart), k)=v00+v11;

    end

    newmat(1:size(mat)/2, 1:size(mat)/2) = matreconstruit_quart;
end

matreconstruit = zeros(size(mat));

for k=1:size(newmat)

    x=newmat(k, 1:size(newmat));

    v0 = UpFilter(x(1:length(x)/2),h,app);
    v1 = UpFilter(x((length(x)/2+1):length(x)),g,det);

    matreconstruit(k, 1:size(newmat)) = v0+v1;

end

for k=1:size(matreconstruit)

    x=matreconstruit(1:size(newmat), k);
    x=transpose(x);

    v00 = UpFilter(x(1:length(x)/2),h,app);
    v11 = UpFilter(x((length(x)/2+1):length(x)),g,det);

    matreconstruit(1:size(newmat), k)=v00+v11;

end
    
figure(1);
imagesc(mat); axis image; colormap(gray);
figure(2);
imagesc(matreconstruit); axis image; colormap(gray);
figure(4);
imagesc(im2double(mat)-matreconstruit);axis image; colormap(gray);




% PSNR :



MSE = 1/(size(mat,1)^2)*norm((im2double(mat)-matreconstruit))^2

PSNR = 10*log10(255^2/MSE)











