function [componete_yuv] = preenche_pixels(componete_yuv, w, h)
  
  intervalo = 1;                                  %% Define um limite de linhas que compoem um conjunto de 4Y
  coluna = 0;                                     %% Contador para saber em qual coluna estamos
  for i = 1 : (w * h)                             %% Percorre o vetor até seu final
    coluna = coluna + 1;                          %% Avança o contador de colunas
    if coluna == w+1                              %% Se a coluna == w+1, então acabou a linha
      coluna = 1;                                 %% Resetamos o contador de colunas
      if intervalo == 2                           %% Se intervalo atingiu o limite de linhas que formam os conjuntos de 4Y
        intervalo = 0;                            %% Zeramos
      end
      intervalo = intervalo + 1;                  %% intervalo++
    end
    
    if componete_yuv(i) == 0                      %% Se o valor da componete_yuv na posição i for zero
      if i - w >= 1 && intervalo == 2             %% Se o 'i-w' não gera uma posição invalida para o vetor 
        componete_yuv(i) = componete_yuv(i-w);    %% Copia o valor da posição superior
      
      else i - 1 >= 1                             %% Se 'i-1' não gera uma posição invalida
        componete_yuv(i) = componete_yuv(i-1);    %% Copia o valor da posiçõo anterior, a esquerda do pixel atual
      end
    end
    
  end
  
  
end