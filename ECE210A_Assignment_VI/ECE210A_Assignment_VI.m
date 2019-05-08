% ECE210A_Assignment_VI
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

% Transfer function numerator, coeff. decrease w/ order from left to right.
num = [0 3/7 2/3 1/2];
% Transfer function denominator, coeff. decrease w/ order from left to
% right.
denom = [1/2 0 1/3 2];
% Use tf2zp to find the zeros, poles, and gains of the transfer function.
[z,p,k] = tf2zp(num, denom);
% Plot poles and zeros
figure;
zplane(z,p);
grid;
title("H(z) Pole/Zero Plot");

%%%
%%
%%%

% Impulse response of the digital filter @ first 50 samples
[h,t] = impz(num, denom, 50);
% Plot impulse response
figure;
stem(t,h);
grid;
title("Impulse Response");
xlabel("n");
ylabel("h[n]");

%%%
%%
%%%

% Define x[n}
n1 = 0:99;
x1 = (-3/4).^(n1);
% Apply the digital filter H to x1 using filter 
y1 = filter(num, denom, x1);
% Plot the result, y1[n]
figure;
stem(n1,y1);
grid;
title("x1 filtered by H via filter");
xlabel("n1");
ylabel("y1[n1]");

%%%
%%
%%%

% Apply the digital filter H to x1 using convolution
[h2,t2] = impz(num, denom, 100);
y2 = conv(h2,x1);
y2 = y2(1:100);
figure;
stem(t2,y2);
grid;
title("x1 filtered by H via convolution");
xlabel("t2");
ylabel("y2[t2]");

%%%
%%
%%%

% Imagine a discrete-tyme system whose impulse response is the Fibonacci
% sequence, use a for loop to generate the first 100 values.
fib = zeros(1,100);
fib(1:2) = 1;
for k=3:100
    fib(k) = fib(k-1) + fib(k-2);
end
% Plot these values using semilogy.
figure;
semilogy(n1, fib, '.');
grid;
title("Fib Seq");
xlabel("n");
ylabel("Fib Seq");
% Assume this is the impulse response of a system and find the output of
% the system for input x1[n] from above.
% H(z) = (z^2)/(z^2 - z -1)
num3 = [1 0 0];
denom3 = [1 -1 -1];
[h3, t3] = impz(num3, denom3, 100);
y3 = conv(h3, x1);
y3 = y3(1:100);
% Plot the output of the system
figure;
stem(t3, y3);
title("Fib Seq conv with x1");
xlabel('n');
ylabel('y3[n]');

%%%
%%