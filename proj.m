clear all;
close all;
clc;

video = fopen("6p4p.yuv", "rb");

w = 6;
h = 4;

% tam_f = w * h * 1.5;

% pos_f = tam_f * (10 - 1);

% fseek(video, pos_f, 'bof');

Y = fread(video, w * h, 'uchar');

U = fread(video, (w/2) * (h/2), 'uchar');
V = fread(video, (w/2) * (h/2), 'uchar');

imagem = zeros(h, w, 3);
imshow(imagem);

k_y = 1;
k_u = 1;
k_v = 1;
intervalo_i = 0;
intervalo_j = 0;
origem_UV = 1;

for i = 1 : size(imagem, 1)
    for j = 1 : size(imagem, 2)
        
        Y_ =  Y(k_y) - 16;
        U_ =  U(k_u) - 128;
        V_ =  V(k_v) - 128;
        
        R = (0.25344 * Y_ - 0.00001 * U_ + 0.291878 * V_) / 0.25344;
        G = (0.25344 * Y_ - 0.10001 * U_ - 0.147122 * V_) / 0.25344;
        B = (0.25344 * Y_ + 0.51499 * U_ - 0.000122 * V_) / 0.25344;
        
        imagem(i, j, 1) = R / 255;
        imagem(i, j, 2) = G / 255;
        imagem(i, j, 3) = B / 255;
        
        intervalo_j = intervalo_j + 1;
        
        k_y = k_y + 1;
        if intervalo_j == 2
          intervalo_j = 0;
          if k_u < numel(U) && k_v < numel(V)  
            k_u =  k_u + 1;
            k_v =  k_v + 1;
          end
          fprintf('\n');
        end
    end
    
    intervalo_i = intervalo_i + 1;
    if intervalo_i == 2
      origem_UV = origem_UV + w/2;
      intervalo_i = 0;
    else
      k_u = origem_UV;
      k_v = origem_UV;
    end
end
disp('FIM: ');
disp(['Comp Y: ', num2str(k_y)]);
disp(['Comp U: ', num2str(k_u)]);
disp(['Comp V: ', num2str(k_v)]);

% Exibe a imagem
imshow(imagem);