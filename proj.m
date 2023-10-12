clear all;
close all;
clc;

w = 6;
h = 4;
frame = 134;
formato = 420;

[Y, U, V] = ler_yuv("6p4p_420.yuv", w, h, frame, formato);
imagem = my_yuv_to_rgb(Y, U, V, w, h, formato);
imshow(imagem);

[Y_novo, w_novo, h_novo] = redimencionar(Y, w, h, 3);
imagem = my_yuv_to_rgb(Y_novo, U, V, w_novo, h_novo, 400);
imshow(imagem);

print_yuv_matriz_pixels(Y_novo, w_novo);
%print_yuv_matriz_pixels(U, w_novo);

%Y_novo = redimencionar(Y_novo, w_novo, h_novo);
imagem = my_yuv_to_rgb(Y_novo, U, V, w_novo, h_novo, 400);
imshow(imagem);

print_yuv_matriz_pixels(Y_novo, w_novo);
disp(['w_novo: ', num2str(w_novo), ' h_novo: ', num2str(h_novo)]);

