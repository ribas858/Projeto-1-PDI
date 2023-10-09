

clear all;
close all;
clc;

video = fopen("foreman.yuv", "rb");

w = 352;
h = 288;

tam_f = w * h * 1.5;

pos_f = tam_f * (10 - 1);

fseek(video, pos_f, 'bof');

Y = fread(video, w * h, 'uchar');
U = fread(video, w/2 * h/2, 'uchar');
V = fread(video, w/2 * h/2, 'uchar');

disp(Y);
disp(U);
disp(V);



frame = {Y, U, V};

imagem_rgb = yuv2rgb(Y, U, V, w, h);




