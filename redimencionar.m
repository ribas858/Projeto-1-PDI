function [Y_novo, U_novo, V_novo, w_novo, h_novo] = redimencionar(Y, U, V, w, h, mult, opt)
  
  if strcmp(opt, "Y") || strcmp(opt, "all")
      
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
    
    if ~strcmp(opt, "all")
      U_novo = U;
      V_novo = V;
    end
  end
  
  if strcmp(opt, "UV") || strcmp(opt, "all")
    U_novo = [];
    V_novo = [];
    U_aux = [];
    V_aux = [];
    intervalo = 0;
    for i = 1 : size(U, 1)
       U_novo = [U_novo; U(i); U(i)];
       V_novo = [V_novo; V(i); V(i)];
       
       U_aux = [U_aux; U(i); U(i)];
       V_aux = [V_aux; V(i); V(i)];
       
       intervalo = intervalo + 1;
       if intervalo == w/2
         U_novo = [U_novo; U_aux];
         V_novo = [V_novo; V_aux];
         U_aux = [];
         V_aux = [];
         intervalo = 0;
       endif
    end
    
    if ~strcmp(opt, "all")
      Y_novo = Y;
      w_novo = w;
      h_novo = h;
    end
    
  end
  
  mult = mult - 1;
  if mult > 0
    [Y_novo, w_novo, h_novo] = redimencionar(Y_novo, w_novo, h_novo, mult);
  endif
  disp(['mult: ', num2str(mult), ' w: ', num2str(w_novo), ' h: ', num2str(h_novo)]);
end