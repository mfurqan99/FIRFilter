%==========================================================
clear; close all; clc;
wp = 0.2*pi;
ws = 0.3*pi;
besar_transisi = ws-wp;
M = ceil(6.6*pi/besar_transisi) + 1;
n = [0:1:M-1];
wc = (ws +wp)/2; % frekuensi cut off ideal
hd = ideal_lp(wc,M);
w_bm = (blackman(M))';
h = hd .* w_bm;
[db, mag, pha, grd, w] = freqz_m(h,[1]);
delta_w = 2*pi/1000;
% pass-band ripple sebenanrnya
Ap = -(min(db(1:1:wp/delta_w+1:1:501)));
% stopband atenuasi minimum
As = -round(max(db(ws/delta_w+1:1:501)));
%plots
subplot(2,2,1); stem(n,hd);
title('respon Pulsa Ideal');
axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('hd(n)');
subplot(2,2,2); stem (n,w_bm);
title('Jendela blackman');
axis([0 M-1 0 1.1]); xlabel('n'); ylabel('w(n)');
subplot(2,2,3); stem(n,h);
title('Respon Pulsa sebenarnya');
axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('h(n)');
subplot(2,2,4); plot(w/pi,db);
title('Respon magnitude dalam dB');grid
axis([0 1 -100 100]);
xlabel('frekuensi dalam unit pi'); ylabel('Decibels')
%============================================================