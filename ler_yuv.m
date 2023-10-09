function [Y, U, V] = ler_yuv(arquivo, w, h, frame, formato)

  %%%%%%%%%%%%%%%%%%%%%%%%%

  modo = formato;
  video = fopen(arquivo, "rb");

  if modo == 420
    tam_f = w * h * 1.5;
    posicao_f = tam_f * frame;
    fseek(video, posicao_f, 'bof');
    Y = fread(video, w * h, 'uchar');
    
    horizontal = 2;
    vertical = 2;
    U = fread(video, (w/2) * (h/2), 'uchar');
    V = fread(video, (w/2) * (h/2), 'uchar');
  
  elseif modo == 422
    tam_f = w * h * 2;
    posicao_f = tam_f * frame;
    fseek(video, posicao_f, 'bof');
    Y = fread(video, w * h, 'uchar');
    
    horizontal = 2;
    vertical = 1;
    U = fread(video, (w/2) * h, 'uchar');
    V = fread(video, (w/2) * h, 'uchar');

  elseif modo == 444
    tam_f = w * h * 3;
    posicao_f = tam_f * frame;
    fseek(video, posicao_f, 'bof');
    Y = fread(video, w * h, 'uchar');
    
    horizontal = 1;
    vertical = 1;
    U = fread(video, w * h, 'uchar');
    V = fread(video, w * h, 'uchar');
    
  elseif modo == 400
    tam_f = w * h;
    posicao_f = tam_f * frame;
    fseek(video, posicao_f, 'bof');
    Y = fread(video, w * h, 'uchar');

  end

end