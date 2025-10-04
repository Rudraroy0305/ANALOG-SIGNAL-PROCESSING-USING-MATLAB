clc;
clear all;
close all;
fc=10;
fm=1;
ts=(1/(100*fc));
fs=(1/ts);
t=0:ts:2;
B=50;
m=cos(2*pi*fm*t);
subplot(5,1,1);
plot(t,m);
grid on;
%modulation
c=cos(2*pi*fc*t);
y=cos(2*pi*fc.*t+B*cos(2*pi*fm.*t));
subplot(5,1,2);
plot(t,y);
grid on;