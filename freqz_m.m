function [db, mag, pha, grd, w] = freqz_m(b,a);
%==========================================================
% db = magnitude relatif dihitung dalam besaran dB,
% dihitung dari 0 sampai pi radian
% mag = magnitude absolut dihitung dari 0 sampai pi radian
% pha = respon fasa dalam radian, dari 0 s.d pi
% grd = group delay dari 0 s.d pi
% w = sebanyak 501 sampel frekuensid dari 0 s.d pi rdian
% b = pembilang polinomoal H(z); (untuk FIR: b =h)
% a = penyebut polinomial H(z); (untuk FIR: a =[1])
[H,w]= freqz(b,a,1000,'whole');
H = (H(1:1:501))'; w = (w(1:1:501))';
mag = abs(H);
pha = angle(H)*180/pi;
grd = grpdelay(H,501);
db = 20*log10((mag+eps)/max(mag));
%=========================================================