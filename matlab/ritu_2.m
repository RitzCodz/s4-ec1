% -------Question 2------

M = 8;  % 8-ary PAM
m = 1:1:M; %for dividing into 8 parts
x = 2 * m - 1 - M; % Equation for the PAM signal points
plot(x,0,'r+','MarkerSize',10);  
% using ‘+’ symbol to plot the points
title('rQ4-8-ary PAM Constellation Diagram');
