clear all;
close all;
clc;

addpath("funcs/");
pkg load image;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Questão 2

arquivo = "imgs/Image1.pgm";
imagem_original = imread(arquivo);

%% 2.1

subplot(1, 2, 1);
imshow(imagem_original);
title('Original');

imagem_laplac = laplaciano(imagem_original, -8);
subplot(1, 2, 2);
imshow(imagem_laplac);
title('Laplaciano -8');

%% 2.2

subplot(2, 2, 1);
imshow(imagem_original);
title('Original');

imagem_gauss = gaussiano_esp(imagem_original, 0.5);
subplot(2, 2, 2);
imshow(imagem_gauss);
title('Gaussiano 0.5');


imagem_laplac = laplaciano(imagem_gauss, -4);
subplot(2, 2, 3);
imshow(imagem_laplac);
title('Gaussiano 0.5 + Laplaciano -4');

%% 2.3

subplot(2, 2, 1);
imshow(imagem_original);
title('Original');

imagem_gauss = gaussiano_esp(imagem_original, 1);
subplot(2, 2, 2);
imshow(imagem_gauss);
title('Gaussiano 1.0');

imagem_laplac = laplaciano(imagem_gauss, -4);
subplot(2, 2, 3);
imshow(imagem_laplac);
title('Gaussiano 1.0 + Laplaciano -4');

%% 2.4
%%%%%%%%%%%%%%%%%%%%
%% Relatório