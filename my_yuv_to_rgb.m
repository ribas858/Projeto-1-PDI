function imagem = my_yuv_to_rgb(Y, U, V, w, h, formato)
  
  modo = formato;
  
  if modo == 420
    horizontal = 2;
    vertical = 2;
  
  elseif modo == 422
    horizontal = 2;
    vertical = 1;
    
  elseif modo == 444
    horizontal = 1;
    vertical = 1;
  end
  
  imagem = zeros(h, w, 3);

  k_y = 1;
  k_u = 1;
  k_v = 1;
  intervalo_i = 0;
  intervalo_j = 0;
  origem_UV = 1;

  for i = 1 : size(imagem, 1)
    for j = 1 : size(imagem, 2)
        
        Y_ =  Y(k_y) - 16;
        
        if modo == 400
          R = Y_;
          G = Y_;
          B = Y_;
        else
          U_ =  U(k_u) - 128;
          V_ =  V(k_v) - 128;
          
          R = (0.25344 * Y_ - 0.00001 * U_ + 0.291878 * V_) / 0.25344;
          G = (0.25344 * Y_ - 0.10001 * U_ - 0.147122 * V_) / 0.25344;
          B = (0.25344 * Y_ + 0.51499 * U_ - 0.000122 * V_) / 0.25344;
        end
        
        imagem(i, j, 1) = R / 255;
        imagem(i, j, 2) = G / 255;
        imagem(i, j, 3) = B / 255;
        
        k_y = k_y + 1;
        
        if modo ~= 400
          intervalo_j = intervalo_j + 1;
  
          if intervalo_j == horizontal
            intervalo_j = 0;
            if k_u < numel(U) && k_v < numel(V)  
              k_u =  k_u + 1;
              k_v =  k_v + 1;
            end
            fprintf('\n');
          end
        end
        
    end
    
    if modo ~= 400
      intervalo_i = intervalo_i + 1;
      if intervalo_i == vertical
        origem_UV = origem_UV + w/2;
        intervalo_i = 0;
      else
        k_u = origem_UV;
        k_v = origem_UV;
      end
    end
  end

end
