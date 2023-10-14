function [Y, U, V] = ler_yuv(arquivo, w, h, frame, formato)

  modo = formato;                                 %% Formato de compressão do video
  video = fopen(arquivo, "rb");                   %% Abre o arquivo

  if modo == 420                                  %% Se for 4:2:0 -- 1 componente UV para cada 4Y -> 1/4
    tam_f = w * h * 1.5;                          %% Tamanho do frame -- 1 byte Y + 0.25 byte U + 0.25 byte V
    posicao_f = tam_f * frame;                    %% Posição do frame, calculada a partir do seu tamanho
    fseek(video, posicao_f, 'bof');               %% Avança para posição calculada
    Y = fread(video, w * h, 'uchar');             %% Lê os dados da componente Y
    
    U = fread(video, (w/2) * (h/2), 'uchar');     %% Lê os dados da componente U
    V = fread(video, (w/2) * (h/2), 'uchar');     %% Lê os dados da componente V
  
  elseif modo == 422                              %% Se for 4:2:2 -- 2 componentes UV para cada 4Y -> 2/4
    tam_f = w * h * 2;                            %% Tamanho do frame -- 1 byte Y + 0.5 byte U + 0.5 byte V
    posicao_f = tam_f * frame;                    %% Posição do frame, calculada a partir do seu tamanho
    fseek(video, posicao_f, 'bof');               %% Avança para posição calculada
    Y = fread(video, w * h, 'uchar');             %% Lê os dados da componente Y
    
    U = fread(video, (w/2) * h, 'uchar');         %% Lê os dados da componente U
    V = fread(video, (w/2) * h, 'uchar');         %% Lê os dados da componente V

  elseif modo == 444                              %% Se for 4:4:4 -- 4 componentes UV para cada 4Y -> 4/4
    tam_f = w * h * 3;                            %% Tamanho do frame -- 1 byte Y + 1 byte U + 1 byte V
    posicao_f = tam_f * frame;                    %% Posição do frame, calculada a partir do seu tamanho
    fseek(video, posicao_f, 'bof');               %% Avança para posição calculada
    Y = fread(video, w * h, 'uchar');             %% Lê os dados da componente Y
    
    U = fread(video, w * h, 'uchar');             %% Lê os dados da componente U
    V = fread(video, w * h, 'uchar');             %% Lê os dados da componente V
    
  elseif modo == 400                              %% Se for 4:0:0 -- Zero componentes UV
    tam_f = w * h;                                %% Tamanho do frame
    posicao_f = tam_f * frame;                    %% Posição do frame, calculada a partir do seu tamanho
    fseek(video, posicao_f, 'bof');               %% Avança para posição calculada 
    Y = fread(video, w * h, 'uchar');             %% Lê os dados da componente Y
    U = [];
    V = [];

  end

  fclose(video);
end