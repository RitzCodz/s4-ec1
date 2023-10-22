%-----------Question 3 QPSK Constellation------
clc 
clear all
close all
num_symbols=10000;
int_symbols=randi([1,4],1,num_symbols);
%100000 random numbers in the range 1 to 4
A=1/sqrt(2);
qpsk_symbols(int_symbols==1)=A+i*A;
qpsk_symbols(int_symbols==2)=A-i*A;
qpsk_symbols(int_symbols==3)=-A+i*A;
qpsk_symbols(int_symbols==4)=-A-i*A;

plot(real(qpsk_symbols),imag(qpsk_symbols),'ored','linewidth',3);
xlim([-2 2]);
ylim([-2 2]);
line(xlim,[0 0], 'color', 'k', 'linewidth',1)  % for x-axis
line([0 0],ylim, 'color', 'k', 'linewidth',1)  % for y-axis

hold on
ezplot('x^2+y^2=1') 
grid on
title('rQ3- QPSK Constellation Diagram');
xlabel('real part');
ylabel('imaginary part');
