%===========================================
d = fdesign.lowpass('n,fc',10,12000,48000);
Hd = window(d,'window',@hann);
fvtool(Hd)
%============================================