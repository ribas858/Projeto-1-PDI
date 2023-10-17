function imagem_filtrada = filtro_notch(arquivo, u, v, d0, n)
  
  imagem = uint8(0);
  w = 0;
  h = 0;
  if strcmp(class(arquivo), "char") || strcmp(class(arquivo), "string")
    imagem = imread(arquivo);
    [h, w] = size(imagem);
  elseif strcmp(class(arquivo), "uint8")
    imagem = arquivo;
    [h, w] = size(imagem);
  end
  
  tam = numel(u);
  
  imagem = double(imagem);
  imagem_dft = ( fftshift(fft2(imagem)) );
  
  for k = 1:tam
    filtro_notch = geraNotch(w, h, u(k), v(k), d0(k), n);
    imagem_dft = imagem_dft .* filtro_notch;
  end
  
  imagem_filtrada = ifft2(ifftshift(imagem_dft));
  imagem_filtrada = uint8(abs(imagem_filtrada));
end