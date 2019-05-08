% ECE210A_Assignment_II
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

% Question 1
% In this problem you will explore the use of MATLAB to approximate 
% derivatives and integrals.
% - Create two vectors of length 100 and 1000, each containing evenly 
% spaced samples of the sine function over one period.

x1 = linspace(0,2*pi,100);
x2 = linspace(0,2*pi,1000);
y1 = sin(x1);
y2 = sin(x2);

% - Approximate the derivatives of both vectors by taking the differences
% of adjacent elements and dividing by the spacing between them.

dy1 = diff(y1)./diff(x1);
figure;
dy1plot = plot(x1(1:end-1),dy1);
title("Approximate Derivative of y = sin(x) (N=100)");

dy2 = diff(y2)./diff(x2);
figure;
dy2plot = plot(x2(1:end-1),dy2);
title("Approximate Derivative of y = sin(x) (N=1000)");

% - You now have length 99 and 999 approximations to some other function; 
% what is it? Find out how well you approximated the values of this 
% function by creating length 99 and 999 vectors of evenly spaced samples 
% over the  same interval, and compute the respective differences. Find 
% the maximum of the absolute value of these differences; which is a 
% better estimate? The answer had better not surprise you!

x3 = linspace(0,2*pi,99);
x4 = linspace(0,2*pi,999);
yCompare1 = cos(x3);
yCompare2 = cos(x4);
y1diff = dy1-yCompare1;
y2diff = dy2-yCompare2;
y1diffmax = max(abs(y1diff));
y2diffmax = max(abs(y2diff));

% - Now approximate the integrals of your original vectors using both 
% cumtrapz and cumsum, yielding 4 approximations for the integral of the 
% sine function. As with above, compare the error values to the analytic 
% integral of the sine over one period; it will be pretty clear if you've
% made an error. 

% Integral of sine wave over one period: 0.

intsumy1 = cumsum(y1)*(2*pi/100);
intcomp1 = intsumy1(100); % Expecting 0

inttrapzy1 = cumtrapz(y1)*(2*pi/100);
intcomp2 = inttrapzy1(100); % Expecting 0

intsumy2 = cumsum(y2)*(2*pi/1000);
intcomp3 = intsumy2(1000); % Expecting 0

inttrapzy2 = cumtrapz(y2)*(2*pi/1000);
intcomp4 = inttrapzy2(1000); % Expecting 0

% All of these integrals are approx. 0.

% - Plot your better approximation for the derivative. Give the plot a 
% title.

figure;
plotme = plot(x2,inttrapzy2);
title("Approximate Integral of y=sin(x) (N=1000, cumtrapz)");

%%%
%%
%%%

% Question 2
% Perform the following matrix operations:
% - Use reshape to create a 10 x 10 matrix A

A = reshape(1:100, [10,10]);

% - Flip the second column of B such that the column is inverted upside down.

Aflipvert = flipud(A);

% - Flip the matrix A from left to right.

Afliphoriz = fliplr(A);

% - Make a vector that is the the column-wise sum of every column of A. 
% The result should be a row vector.

colsum = sum(A);

% - Make a vector that is the row-wise mean of every row of A. The result 
% should be a column vector.

rowmean = mean(A, 2);

% - Delete the last column of A.

A(:,end) = [];

%%%
%%
%%%

% Question 3 
% Generate a 300 x 500 matrix with entries Aij = (i^2+j^2)/(i+j+3) using 
% the following methods and use tic toc to time the speed of each and 
% write a comment noting the order of the speeds of these methods. You 
% will have to find out, using doc, Google, or frantically messaging me,
% how tic toc works.
rows = 300;
columns = 500;
% - Using for loops and no pre-allocation.
B = [];
tic;
for k = 1:rows
    appendRow = [];
    for l = 1:columns
        appendRow = horzcat(appendRow, (k^2 + l^2)/(k+l+3));
    end
    B = [B; appendRow];
end
T1 = toc;
% - Using for loops and pre-allocating memory with zeros.
C = zeros(rows, columns);
tic;
for k = 1:rows
    for l = 1:columns
        C(k, l) = (k^2 + l^2)/(k+l+3);
    end
end
T2 = toc;
% - Using only elementwise matrix operations. Note: repmat and meshgrid 
% will be useful here.
tic;
rowPop = 1:rows;
columnPop = 1:columns;
[COL,ROW] = meshgrid(columnPop, rowPop);
D = (COL.^2 + ROW.^2)./(COL + ROW + 3);
T3 = toc;
% Fastest (least time) to slowest (most time): T3, T2, T1
%%%