function imagem_filtrada = gaussiano_freq(arquivo, sigma)

  imagem = uint8(0);
  if strcmp(class(arquivo), "char")
    imagem = imread(arquivo);  
  elseif strcmp(class(arquivo), "uint8")
    imagem = arquivo;
  end

  filtro_gauss = fspecial('gaussian', 3, sigma);

  imagem_filtrada = imfilter(imagem, filtro_gauss);

end