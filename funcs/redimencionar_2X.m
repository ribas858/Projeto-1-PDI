function [Y_novo, U_novo, V_novo, w_novo, h_novo] = redimencionar_2X(Y, U, V, w, h, vzs, opt, formato)
  
  if strcmp(opt, "Y") || strcmp(opt, "all")                 %% Se a opção for redimencionar apenas o Y, ou se for para
                                                            %% redimencionar todos os componentes YUV ("all")
                                                            %%
    Y_novo = [];                                            %% Novo vetor Y
    intervalo = 0;                                          %% Contador para saber quando acabou a linha
    for i = 1 : size(Y, 1)                                  %%
       Y_novo = [Y_novo; Y(i); 0];                          %% O vetor Y_novo recebe ele mesmo concatenado com Y na posição i, mais um zero
       intervalo = intervalo + 1;                           %% Avança intervalo
       if intervalo == w                                    %% Se o intervalo for igual a largura w, então acabou a linha
         for j = 1 : (w*2)                                  %% Assim fazemos um for para criar uma nova linha com zeros
            Y_novo = [Y_novo; 0];                           %%
         end                                                %%
         intervalo = 0;                                     %% Zera o intervalo
       endif                                                %%
    end                                                     %%
                                                            %%
    w_novo = w * 2;                                         %% Calculamos a nova largura w, como sendo o dobro
    h_novo = h * 2;                                         %% O mesmo para altura h
    Y_novo = preenche_pixels(Y_novo, w_novo, h_novo);       %% Chamamos a função para preencher os pixels pretos(0) com os valores de brilho correspondentes
                                                            %%
    if ~strcmp(opt, "all")                                  %% Se a opção não for redimencionar tudo, e sim redimencionar o Y apenas,
      U_novo = U;                                           %% devolvemos os valores originais de U e V
      V_novo = V;                                           %%
    end                                                     %%
  end                                                       %%
  
  if ( strcmp(opt, "UV") || strcmp(opt, "all") ) && formato ~= 400

                                                            %% Se a opção for redimencionar apenas os U e V, ou se for para
                                                            %% redimencionar todos os componentes YUV ("all"), E se o formato não for 400,
                                                            %% pois se for 400, não existe componentes UV
    U_novo = [];                                            %% Novo vetor U
    V_novo = [];                                            %% Novo vetor V
    U_aux = [];                                             %%
    V_aux = [];                                             %%
    intervalo = 0;                                          %% Contador para saber se chegou no limite mínimo de cores por linha nos vetores UV
    for i = 1 : size(U, 1)                                  %% For de 1 ate o tamanho de U. Poderua ser V, pois obrigatoriamente os 2 devem ter o mesmo tamanho
       U_novo = [U_novo; U(i); U(i)];                       %% U_novo recebe ele mesmo concatenado com U na posição i duas vezes. Duplica os valores
       V_novo = [V_novo; V(i); V(i)];                       %% V_novo recebe ele mesmo concatenado com V na posição i duas vezes. Duplica os valores
                                                            %%
       U_aux = [U_aux; U(i); U(i)];                         %% Fazemos o mesmo para U_aux 
       V_aux = [V_aux; V(i); V(i)];                         %%
                                                            %%
       intervalo = intervalo + 1;                           %% Avança o intervalo
       
       if formato == 444                                    %% Se o formato for 4:4:4, a largura de repetir o conjunto é igual a largura w da imagem
         limite = w;                                        %%
       else                                                 %%
         limite = w/2                                       %% Caso contrário, a largura de repetir o conjunto, é metade da largura w da imagem
       end                                                  %%
       
       if intervalo == limite                               %% Se o valor de intervalo atingir limite de repetir o conjunto
         U_novo = [U_novo; U_aux];                          %% Concatenamos U_novo(primeira linha de pixels) com U_aux(segunda linha de pixels),
         V_novo = [V_novo; V_aux];                          %% pois duplicamos tanto ta horizontal quanto na vertical
         U_aux = [];                                        %% O mesmo vale para V
         V_aux = [];                                        %%
         intervalo = 0;                                     %%
       endif                                                %%
    end                                                     %%
                                                            %%
    if ~strcmp(opt, "all")                                  %% Se a opção não for redimencionar tudo, e sim redimencionar o U e V,
      Y_novo = Y;                                           %% devolvemos Y com sua largura w e altura h originais
      w_novo = w;                                           %%
      h_novo = h;                                           %%
    end                                                     %%
                                                            %%
  end                                                       %%
  
  vzs = vzs - 1;                                            %% Diminuimos em 1, a quantidade de vezes que devemos chamar a função
  if vzs > 0                                                %% Se for maior que zero, chamamos redimencionar_2X novamente passando os valores atualizados
    [Y_novo, U_novo, V_novo, w_novo, h_novo] = redimencionar_2X(Y_novo, U_novo, V_novo, w_novo, h_novo, vzs, opt, formato);
  endif

end