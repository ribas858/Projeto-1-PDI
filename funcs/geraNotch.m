function filtro_notch = geraNotch(w, h, uk, vk, D0, n)

  filtro_notch = zeros(h, w);
  for i = 1:h
      for j = 1:w
          Dk = sqrt((i - (h/2) - uk)^2 + (j - (w/2) -vk)^2);
          Dk_neg = sqrt((i - (h/2) + uk)^2 + (j - (w/2) + vk)^2);
          filtro_notch(i, j) = ( 1 / (1 + (D0/Dk)^2*n )) * ( 1 / (1 + (D0/Dk_neg)^2*n ));
      end
  end

end