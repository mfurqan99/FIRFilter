function hd = ideal_lp(wc,M);
% Komputasi Low-pass Filter Ideal
%===============================================
% hd = respon pulsa ideal dari 1 s.d M-1
% wc = frekuensi cut off in radians
% M = panjang filter ideal
alpha = (M-1)/2;
n = [0:1:(M-1)];
m = n - alpha;
fc = wc/pi;
hd = fc*sinc(fc*m);