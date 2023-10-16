function imagem_filtrada = laplaciano(arquivo, tipo)
  
  imagem = uint8(0);
  if strcmp(class(arquivo), "char")
    imagem = imread(arquivo);  
  elseif strcmp(class(arquivo), "uint8")
    imagem = arquivo;
  end

  
  if tipo == 4 || tipo == -4
    filtro_lp1 = [0 1 0; 1 -4 1; 0 1 0];
    if tipo == 4
      filtro_lp1 = filtro_lp1 * (-1);
    end
    filtro = filtro_lp1;
 
  elseif tipo == 8 || tipo == -8
    filtro_lp2 = [1 1 1; 1 -8 1; 1 1 1];
    if tipo == 8
      filtro_lp2 = filtro_lp2 * (-1);
    end
    filtro = filtro_lp2;
  end
  centro_filtro = filtro(2,2);
  
  imagem_f = imfilter(imagem, filtro);


  if centro_filtro < 0
      imagem_filtrada = imagem - imagem_f;
  else    
      imagem_filtrada = imagem + imagem_f;
  end
  
end