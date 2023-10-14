function imagem = my_yuv_to_rgb(Y, U, V, w, h, formato)
  
  modo = formato;                 %% Formato de compressão do video
  
  if modo == 420                  %% Formato 4:2:0 -- 1 componente UV para cada 4Y -> 1/4
    horizontal = 2;               %% Limite horizontal da divisão de cores
    vertical = 2;                 %% Limite vertical da divisão de cores
  
  elseif modo == 422              %% Formato 4:2:2 -- 2 componentes UV para cada 4Y -> 2/4
    horizontal = 2;               %% Limite horizontal da divisão de cores
    vertical = 1;                 %% Limite vertical da divisão de cores
    
  elseif modo == 444              %% Formato 4:4:4 -- 4 componentes UV para cada 4Y -> 4/4
    horizontal = 1;               %% Limite horizontal da divisão de cores
    vertical = 1;                 %% Limite vertical da divisão de cores
  end
  
  imagem = zeros(h, w, 3);        %% Cria uma imagem toda preta, com 3 camadas de cores

  k_y = 1;                        %% Índice para componente Y
  k_u = 1;                        %% Índice para componente U
  k_v = 1;                        %% Índice para componente V
  intervalo_horizontal = 0;       %% Intervalo de cores na horizontal
  intervalo_vertical = 0;         %% Intervalo de cores na vertical
  origem_UV = 1;                  %% Origem do vetor de Cores UV após mudar de linha

  for i = 1 : size(imagem, 1)
    for j = 1 : size(imagem, 2)
        
        Y_ =  Y(k_y);             %% Atribui a Y_ o valor de brilho na posição k_y
        
        if modo == 400            %% Se o modo for 4:0:0 não existe componentes de crominancia
          R = Y_;                 %%
          G = Y_;                 %%
          B = Y_;                 %%
        else
          U_ =  U(k_u) - 128;     %% Atribuo a U_ o valor de crominancia na posição k_u
          V_ =  V(k_v) - 128;     %% Atribuo a V_ o valor de crominancia na posição k_v
          
          R = (0.25344 * Y_ - 0.00001 * U_ + 0.291878 * V_) / 0.25344;          %% Aplico a formula de converção YUV para RGB
          G = (0.25344 * Y_ - 0.10001 * U_ - 0.147122 * V_) / 0.25344;          %%
          B = (0.25344 * Y_ + 0.51499 * U_ - 0.000122 * V_) / 0.25344;          %%
        end
        
        imagem(i, j, 1) = R / 255;                                              %% Normalizo os valores entre 0 e 1
        imagem(i, j, 2) = G / 255;                                              %%
        imagem(i, j, 3) = B / 255;                                              %%
        
        k_y = k_y + 1;                                                          %% Avanço para o próximo Y
        
        if modo ~= 400                                                          %% Se o modo não for 4:0:0, eu tenho que lidar com os componentes UV
          
          intervalo_horizontal = intervalo_horizontal + 1;                      %% Avanço o intervalo horizontal de cores em 1
          if intervalo_horizontal == horizontal                                 %% Se o intervalo atingir o limite horizontal, então
                                                                                %% devo mudar de cor(UV), pois a cada 
                                                                                %% {valor de horizontal} pixels na
                                                                                %% horizontal temos um conjunto UV diferente
            
            intervalo_horizontal = 0;                                           %% Se atingiu o limite, zeramos
            if k_u < numel(U) && k_v < numel(V)                                 %% Teste para não estourar o vetor de UV
              k_u =  k_u + 1;                                                   %% Avanço para o próximo U
              k_v =  k_v + 1;                                                   %% Avanço para o próximo V
            end

          end
        end
        
    end                                                                         %% fim do for "j"
    
    if modo ~= 400                                                              %% Se o modo não for 4:0:0, eu tenho que lidar com os componentes UV
      
      intervalo_vertical = intervalo_vertical + 1;                              %% Avanço o intervalo vertical de cores em 1
                                                                                
      if intervalo_vertical == vertical                                         %% Mesma lógica do horizontal
        intervalo_vertical = 0;                                                 %% Se atingiu o limite, zeramos
        
        origem_UV = origem_UV + w/2;                                            %% Se atingiu o limite vertical, então temos um novo
                                                                                %% ponto de partida no vetor UV
        if origem_UV >  numel(U) || origem_UV >  numel(V)
          origem_UV = 1;
        end
      else
        k_u = origem_UV;                                                        %% Caso contrario, a origem para voltar no vetor UV
        k_v = origem_UV;                                                        %%  a cada linha, é a mesma
      end
    end
    
  end                                                                           %% fim do for "i"

end
