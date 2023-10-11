clear all;
close all;
clc;

w = 6;
h = 4;
frame = 134;
formato = 444;

[Y, U, V] = ler_yuv("6p4p_444.yuv", w, h, frame, formato);
imagem = my_yuv_to_rgb(Y, U, V, w, h, formato);
imshow(imagem);

[Y_novo, w_novo, h_novo] = zeros_linha_coluna(Y, w, h);
imagem = my_yuv_to_rgb(Y_novo, U, V, w_novo, h_novo, 400);
imshow(imagem);

for i = 1 : (w_novo * h_novo)
  if Y_novo(i) == 0
    if i - w_novo >= 1
      Y_novo(i) = Y_novo(i-w_novo);
    elseif i - 1 >= 1
      Y_novo(i) = Y_novo(i-1);
    end
  end
end

imagem = my_yuv_to_rgb(Y_novo, U, V, w_novo, h_novo, 400);
imshow(imagem);

print_yuv_matriz_pixels(Y_novo, w_novo);
disp(['w_novo: ', num2str(w_novo), ' h_novo: ', num2str(h_novo)]);

