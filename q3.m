clear all;
close all;
clc;

addpath("funcs/");
pkg load image;

imagem_original = imread("imgs/moire.jpeg");

u = [39, -39, 78, -78];
v = [30, 30, 30, 30];
d0 = [10, 10, 5, 5];
n = 4;

subplot(1, 2, 1);
imshow(imagem_original);
title('Original');

imagem_filtrada = filtro_notch(imagem_original, u, v, d0, n);
subplot(1, 2, 2);
imshow(imagem_filtrada);
title('Notch');