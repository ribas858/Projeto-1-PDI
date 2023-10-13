clear all;
close all;
clc;

w = 6;
h = 4;
frame = 134;
formato = 420;

[Y, U, V] = ler_yuv("6p4p_420.yuv", w, h, frame, formato);

%U = U(1:3);
%V = V(1:3);

%imagem = my_yuv_to_rgb(Y, U, V, w, h, 420);
%imshow(imagem);


%print_yuv_matriz_pixels(U, w);
%U_novo = [U(1:w/2); U(1:w/2); U( (w/2)+1: w);  U( (w/2)+1: w)];
%V_novo = [V(1:w/2); V(1:w/2); V( (w/2)+1: w);  V( (w/2)+1: w)];
%print_yuv_matriz_pixels(U_novo, numel(U_novo));


[Y, U, V, w, h] = redimencionar(Y, U, V, w, h, 1, "UV");
imagem = my_yuv_to_rgb(Y, U, V, w, h, 420);
imshow(imagem);

print_yuv_matriz_pixels(U, 12);
print_yuv_matriz_pixels(V, 12);

%U = [ 161; 161; 77; 77; 77; 77;   161; 161; 77; 77; 77; 77;      73; 174; 43 ];
%V = [ 96; 96; 113; 113; 137; 137; 96; 96; 113; 113; 137; 137;   207; 122; 177];
%[V_novo, w2, h2] = redimencionar(V, w, 1, 1, 1);
%print_yuv_matriz_pixels(V_novo, w2);


%[Y_novo, w_novo, h_novo] = redimencionar(Y, w, h, 3);
%imagem = my_yuv_to_rgb(Y_novo, U, V, w_novo, h_novo, 400);
%imshow(imagem);

print_yuv_matriz_pixels(Y_novo, w_novo);
%print_yuv_matriz_pixels(U, w_novo);

%Y_novo = redimencionar(Y_novo, w_novo, h_novo);
imagem = my_yuv_to_rgb(Y_novo, U, V, w_novo, h_novo, 400);
imshow(imagem);

print_yuv_matriz_pixels(Y_novo, w_novo);
disp(['w_novo: ', num2str(w_novo), ' h_novo: ', num2str(h_novo)]);

