function [Y_novo, w_novo, h_novo] = zeros_linha_coluna(Y, w, h)
  
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
  
end