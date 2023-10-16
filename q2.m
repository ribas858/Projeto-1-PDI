clear all;
close all;
clc;

addpath("funcs/");
pkg load image;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Questão 2

arquivo = "imgs/Image1.pgm";

%% 2.1
imagem_laplac = laplaciano(arquivo, -8);
imshow(imagem_laplac);

%% 2.2

imagem = imread(arquivo);
subplot(1, 3, 1);
imshow(imagem);

imagem_gauss = gaussiano_esp(arquivo, 0.5);

imagem_laplac = laplaciano(imagem_gauss, -4);
subplot(1, 3, 2);
imshow(imagem_laplac);

%% 2.3

imagem_gauss = gaussiano_esp(arquivo, 1);

imagem_laplac = laplaciano(imagem_gauss, -4);
subplot(1, 3, 3);
imshow(imagem_laplac);

%% 2.4 
%%%%%%%%%%%%%%%%%%%%