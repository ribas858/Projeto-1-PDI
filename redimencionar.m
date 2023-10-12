function [Y_novo, w_novo, h_novo] = redimencionar(Y, w, h, mult)
  
  Y_novo = [];
  intervalo = 0;
  
  for i = 1 : size(Y, 1)
     Y_novo = [Y_novo; Y(i); 0];
     intervalo = intervalo + 1;
     if intervalo == w
       for j = 1 : (w*2)
          Y_novo = [Y_novo; 0];
       end
       intervalo = 0;
     endif
  end
  
  w_novo = w * 2;
  h_novo = h * 2;
  
  Y_novo = preenche_pixels(Y_novo, w_novo, h_novo);
  
  mult = mult - 1;
  if mult > 0
    [Y_novo, w_novo, h_novo] = redimencionar(Y_novo, w_novo, h_novo, mult);
  endif
  disp(['mult: ', num2str(mult), ' w: ', num2str(w_novo), ' h: ', num2str(h_novo)]);
end