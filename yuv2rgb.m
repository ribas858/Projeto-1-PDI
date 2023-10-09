function rgb = yuv2rgb(yuv)

% Converte uma imagem YUV para RGB

% Entrada:
% yuv: Imagem YUV em formato [w x h x 3]

% Saída:
% rgb: Imagem RGB em formato [w x h x 3]

yuv = reshape(yuv, [size(yuv, 1), size(yuv, 2), 3]);

% Matrizes de conversão
Y = [0.00456621 0.00456621 0.00456621; 0.00791071 0.00791071 0.00791071; 0.00456621 0.00456621 0.00456621];
U = [0.00625893 -0.00153632 -0.00318811; -0.00318811 0.00625893 -0.00153632; 0.00625893 -0.00153632 -0.00318811];
V = [-0.00318811 -0.00318811 0.00625893; 0.00625893 -0.00318811 -0.00153632; -0.00318811 0.00625893 -0.00153632];

% Converte a imagem
for i = 1:size(yuv, 1)
    for j = 1:size(yuv, 2)
        % Converte um pixel
        Y = yuv(i, j, 1);
        U = yuv(i, j, 2) - 128;
        V = yuv(i, j, 3) - 128;

        R = Y + 1.139834576 * V;
        G = Y - 0.3946460533 * U - 0.5806008927 * V;
        B = Y + 2.032110144 * U;

        rgb(i, j, 1) = R;
        rgb(i, j, 2) = G;
        rgb(i, j, 3) = B;
    end
end

end