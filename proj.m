clear all;
close all;
clc;

w = 6;
h = 4;
frame = 10;
formato = 420;

[Y, U, V] = ler_yuv("foreman.yuv", w, h, frame, formato);

imagem = my_yuv_to_rgb(Y, U, V, w, h, formato);

imshow(imagem);