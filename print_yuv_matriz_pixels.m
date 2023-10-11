function print_yuv_matriz_pixels(Y, w)
  col = 0;
  fprintf('\n');
  for i = 1 : size(Y, 1)
    fprintf('%d ', Y(i));
    col = col + 1;
    if col == w
      col = 0;
      fprintf('\n');
    end
  end
  fprintf('\n');  
end