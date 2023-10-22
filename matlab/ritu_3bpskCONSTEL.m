%-----------Question 3 BPSK Constellation------
clc 
clear all
close all
num_symbols=10000;
int_symbols=randi([1,2],1,num_symbols);
%100000 random numbers in the range 1 to 2
bpsk_symbols=zeros(size(int_symbols));
bpsk_symbols(int_symbols==1)=1;
bpsk_symbols(int_symbols==2)=-1;

plot(real(bpsk_symbols),imag(bpsk_symbols),'ored','linewidth',3);
xlim([-2 2]);
ylim([-2 2]);
line(xlim,[0 0], 'color', 'k', 'linewidth',1)  % for x-axis
line([0 0],ylim, 'color', 'k', 'linewidth',1)  % for y-axis

 
grid on
title('rQ3- BPSK Constellation Diagram');
xlabel('real part');
ylabel('imaginary part');
