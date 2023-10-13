function [componete_yuv] = preenche_pixels(componete_yuv, w, h)
  
  intervalo = 1;
  coluna = 0;
  for i = 1 : (w * h)
    coluna = coluna + 1;
    if coluna == w+1
      coluna = 1;
      if intervalo == 2
        intervalo = 0;
      endif
      intervalo = intervalo + 1;
    endif
    
    %disp(['intervalo: ', num2str(intervalo), ' i: ', num2str(i), ' coluna: ', num2str(coluna)]);
    if componete_yuv(i) == 0
      if i - w >= 1 && intervalo == 2
        componete_yuv(i) = componete_yuv(i-w);
      elseif i - 1 >= 1
        componete_yuv(i) = componete_yuv(i-1);
      end
    end
  end
  
  
end