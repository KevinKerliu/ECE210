% ECE210A_Assignment_IV
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

% Test all of the above functions on some random complex vectors. (use rand
% to make a random vector) First test the case where there are more 
% elements in each vector than the number of vectors. Then test the case 
% where the number of vectors is equal to the number of elements in a 
% vector. Compare the errors.

% More elements in each vector than the number of vectors.
X1 =  rand(3, 2) + 1j*rand(3, 2);
gS_X1 = gramSchmidt(X1);
r1 = isOrthonormal(gS_X1);

test = [1j, 7+2j, 1+3j];
z1 = orthoProj(test, gS_X1);
error1 = test(:) - z1;

% The number of vectors is equal to the number of elements in a vector.
X2 =  rand(3, 3) + 1j*rand(3, 3);
gS_X2 = gramSchmidt(X2);
r2 = isOrthonormal(gS_X2);

% Use test vector from above
z2 = orthoProj(test, gS_X2);
error2 = test(:) - z2;
%%%
%%
%%%

% Uniformly sample sin(x) on [0; 2*pi].
x = linspace(0, 2*pi, 1000);
y = sin(x);

% Generate 5 Gaussians with the equation:
% (1/sqrt(2*pi*sd^2)) * exp( -(x - mu)^2 / sd^2)
% Give each Gaussian standard deviation 1 (sd = 1) and pick the mean from a 
% linearly spacedvector ranging from 0 to 2*pi.
mu = pi * [0, 1/2, 1, 3/2, 2];
[~, c] = size(mu);
sd = 1;
f = zeros(c, 1000);
for k=1:c
    f(k,:) = (1/sqrt(2*pi*sd)) * exp( -(x - mu(k)).^2 / sd^2);
end
% Consider using ndgrid for compact code. Plot the Sinusoid and Gaussians 
% on the same plot. Give axis labels and a title. Use gramSchmidt to create 
% an orthonormal set of vectors from the Gaussians. Use orthoProj to
% estimate the sinusoid from that set of vectors. Create a 2x1 subplot. 
% Plot the sinusoid and the estimated sinusoid together on the upper plot. 
% Plot the orthonormal basis functions on the lower plot. Give all plots 
% proper labels and titles.

figure('Name','Plot 1');
plot(x, y);
hold on;
plot(x, f);
axis([0, 2*pi, -2, 2]);
title('5 Gaussians');
xlabel('x-axis');
ylabel('y-axis');

gsf = gramSchmidt(f.');
sinEst = orthoProj(y, gsf);

figure;
subplot(2, 1, 1);
plot(x, y);

hold on;
plot(x, sinEst);
axis([0, 2*pi, -2, 2]);
title("Sinusoid Estimate");
xlabel('x');
ylabel('y');

hold on;
subplot(2, 1, 2);
plot(x, gsf);
axis([0, 2*pi, -0.2, 0.2]);
title("ONB Functions");
xlabel('x');
ylabel('y');
%%%
%%