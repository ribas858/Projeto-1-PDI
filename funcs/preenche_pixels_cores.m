function [U, V] = preenche_pixels_cores(U, V, limite)
  
  U_aux = [];                                               %% Auxiliar
  V_aux = [];                                               %%
  intervalo = 0;                                            %% Contador para saber quando esta na linha de zeros
  modo = 1;                                                 %% modo 1: alterna. modo 2: linha de zeros
  j = 1;                                                    %% Indice para vetores auxiliares
  for i = 1 : size(U, 1)
    intervalo = intervalo + 1;                              %% Avança o intervalo
                                                            %%
    if U(i) == 0 && V(i) == 0 && modo == 1                  %% Se a posição i é zero e estamos no modo alternado
      if i - 1 >= 1                                         %% Evita estourar vetores
        U(i) = U(i-1);                                      %% Posição que contem zero, vira o vizinho
        V(i) = V(i-1);                                      %%
        U_aux = [U_aux; U(i-1); U(i)];                      %% Copia o que esta em U até o momento
        V_aux = [V_aux; V(i-1); V(i)];                      %%
      end                                                   %%
    end                                                     %%
    
    if U(i) == 0 && V(i) == 0 && modo == 2                  %% Se a posição i é zero e estamos no modo linha de zeros
        U(i) = U_aux(j);                                    %% Copia o Aux para o lugar dos zeros
        V(i) = V_aux(j);                                    %%
        j = j + 1;                                          %%
    end                                                     %%
    
    if intervalo == limite*2 && modo == 1                   %% Se o intervalo atingiu o limite * 2( x2 pois o vetor ja foi expandido), e estamos no modo alternado
      modo = 2;                                             %% Troca de modo
      intervalo = 0;                                        %% 
    end                                                     %%
    
    if intervalo == limite*2 && modo == 2                   %% Se o intervalo atingiu o limite * 2( x2 pois o vetor ja foi expandido), e estamos no modo linha de zeros
      modo = 1;                                             %% Troca de modo
      intervalo = 0;                                        %%
      U_aux = [];                                           %%
      V_aux = [];                                           %%
      j = 1;                                                %%
    end                                                     %%
    
  end
      
  
end