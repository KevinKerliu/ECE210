% ECE210A_Assignment_VII
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

% Question 1
t1 = 0:10e-6:1e-3;
f1 = 1e3:50e3;

[T1,F1] = meshgrid(t1,f1);
x1 = sin(2*pi.*T1.*F1);
x1 = sum(x1);

%%%
%%
%%%

% Question 2
% Butterworth Lowpass Filter
Fs = 100e3;         % Sampling Frequency
Fpass = 10e3;       % Passband Frequency
Fstop = 20e3;       % Stopband Frequency
Apass = 5;           % Passband Ripple (dB)
Astop = 50;          % Stopband Attenuation (dB)

% Normalize to Nyquist Frequency
Wpass = Fpass/(Fs/2);
% Normalize to Nyquist Frequency
Wstop = Fstop/(Fs/2); 
% Find minimum order for which this filter is realizable
n = buttord(Wpass,Wstop,Apass,Astop);
% Find the transfer function coefficients
[b, a] = butter(n, Wpass, 'low');
% Filter the signal w/ this filter
y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure;
plot(f,Y);
title('Butterworth Lowpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%%%
%%
%%%

% Question 3
% Chebyshev Type I Highpass Filter
Fs = 100e3;         % Sampling Frequency
Fstop = 15e3;       % Stopband Frequency
Fpass = 35e3;       % Passband Frequency
Astop = 40;          % Stopband Attenuation (dB)
Apass = 2;           % Passband Ripple (dB)

% Normalize to Nyquist Frequency
Wpass = Fpass/(Fs/2);
% Normalize to Nyquist Frequency
Wstop = Fstop/(Fs/2); 
% Find minimum order for which this filter is realizable
n = cheb1ord(Wpass, Wstop, Apass, Astop);
% Find the transfer function coefficients
[b, a] = cheby1(n, Apass, Wpass, 'high');
% Filter the signal w/ this filter
y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure;
plot(f,Y);
title('Chebychev I Highpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%%%
%%
%%%

% Question 4
% Chebyshev Type II Bandstop Filter
Fs = 100e3;          % Sampling Frequency
Fpass1 = 5e3;        % First Passband Frequency
Fstop1 = 15e3;       % First Stopband Frequency
Fstop2 = 30e3;       % Second Stopband Frequency
Fpass2 = 45e3;       % Second Passband Frequency
Apass  = 1;           % Passband Ripple (dB)
Astop  = 50;          % Stop Band Attenuation (dB)
Fpass = [Fpass1, Fpass2];
Fstop = [Fstop1, Fstop2];

% Normalize to Nyquist Frequency
Wpass = Fpass/(Fs/2);
% Normalize to Nyquist Frequency
Wstop = Fstop/(Fs/2); 
% Find minimum order for which this filter is realizable
n = cheb2ord(Wpass, Wstop, Apass, Astop);
% Find the transfer function coefficients
[b, a] = cheby2(n, Apass, Wstop, 'stop');
% Filter the signal w/ this filter
y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure
plot(f,Y);
title('Chebychev II Bandstop Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%%%
%%
%%%

% Question 5 
% Elliptic Bandpass Filter
Fs = 100e3;      % Sampling Frequency
Fstop1 = 15e3;   % First Stopband Frequency
Fpass1 = 20e3;   % First Passband Frequency
Fpass2 = 30e3;   % Second Passband Frequency
Fstop2 = 35e3;   % Second Stopband Frequency
Astop  = 50;      % Stopband Attenuation (dB)
Apass  = 5;       % Passband Ripple (dB)
Fpass = [Fpass1, Fpass2];
Fstop = [Fstop1, Fstop2];

% Normalize to Nyquist Frequency
Wpass = Fpass/(Fs/2);
% Normalize to Nyquist Frequency
Wstop = Fstop/(Fs/2); 
% Find minimum order for which this filter is realizable
n = ellipord(Wpass, Wstop, Apass, Astop);
% Find the transfer function coefficients
[b, a] = ellip(n, Apass, Astop, Wpass, 'bandpass');
Filter the signal w/ this filter
y = filter(b,a,x1);

N = 2^15;
Y = fftshift(abs(fft(y,N)))/N;
f = Fs.*(-N/2:N/2-1)/N;

figure
plot(f,Y);
title('Elliptical Bandpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

%%%