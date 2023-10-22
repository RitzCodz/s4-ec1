% -------Question 1------

%for a period of 10 in the range [-8,8]
x = -8:.01:8;

y = 1/ sqrt(2*pi) * exp(-x.*x/2);
y = transpose(padarray(transpose(y),200,'both'));
y_1 = y;
t = -5:(1/(length(y) - 1))*10:5;

%for plotting a periodic signal
y = repmat(y,5);
t = 0:(1/(length(y) - 1))*50:50;

%taking the Fourier transform for magnitude and phase responses
% using FFT
n = 1024;
f_y = fft(y_1,n);

% for the magnitude spectra
mag = (abs(f_y));
subplot(2,1,1); 
plot(mag);
title('rQ1-Magnitude Response');
xlabel('Freq');
ylabel('Mag');

% for the phase spectra
ang = (angle(f_y));
plot(ang);
subplot(2,1,2) 
figure(2)
title('rQ2-Phase Response');
xlabel('Freq');
ylabel('Phase');
