% ECE210A_Assignment_III
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

% Question 1 
% Lunar Eclipse 
% This question guides you through some basic image processing techniques 
% in MATLAB. You will create interesting images with relational and 
% logical indexing, as well as the imshow function to visualize what
% you have created.

% Create a 100 x 100 A where its contents are all ones.

A = ones(100,100);

% Create a 100 x 100 B where its contents are all zeros.

B = zeros(100,100);

% In matrix A, set the values of entry aij equal to 0 if
% sqrt((i - 50)^2 + (j - 50)^2) < 20. 
% Hint : meshgrid would be useful in creating the indices.

i = 1:100;
j = 1:100;
[I,J] = meshgrid(i,j);

if1 = logical(sqrt(((I-50).^2) + ((J-50).^2)) < 20);
A(if1) = 0;  

% In matrix B, set the values of entry aij equal to 1 if
% sqrt((i - 40)^2 + (j - 40)^2) < 20. 

if2 = logical(sqrt(((I-40).^2) + ((J-40).^2)) < 20);
B(if2) = 1;

% Visualize the following results with figure and imshow. 
% Describe each of the results with one sentence each.
% - A
figure;
imshow(A);
title("A");
% - B
figure;
imshow(B);
title("B");
% - Intersection between A and B
figure
imshow(A & B);
title("A and B");
% - Union between A and B
figure;
imshow(A | B);
title("A or B");
% - Complement of intersection between A and B
figure;
imshow(~(A&B));
title("A nand B");
% - Complement of union between A and B
figure;
imshow(~(A | B));
title("A nor B");

%%%
%%
%%%

% Question 2
% Fun with Find
% Write a function to return the value and index of a number in a 
% vector / matrix that is closest to a desired value. The function should
% be called as [val; ind] = findClosest(x; desiredValue). This function 
% can be accomplished in less than five lines. You will find abs, min 
% and/or find useful.
% Hint: You may have some trouble using min when x is a matrix.
% To convert the matrix to a vector, you can use y = x(:). Show that it 
% works by finding the value closest to 3/2 (and index of said value) in
% sin( linspace(0,5,100) ) + 1.

[val, ind] = findClosest(sin( linspace(0,5,100) ) + 1, 3/2);


%%%
%%
%%%

% Question 3
% Sincing Ship
% Here we will look at a function near and dear to the signal processing 
% community's heart - the cardinal sine function, or sinc. You are going 
% to implement your own functions to find the local extremum and roots.

% Sample a sinc with 10001 linearly spaced points on [-2pi; 2pi] using the 
% sinc function. Create a plot using plot(x,y).

x = linspace(-2*pi, 2*pi, 10001);
y = sinc(x);

figure;
plot(x, y);
title("y = sinc(x)");

% Create a function (either anonymously or in another file) which locates 
% the indices at which the input vector transitions from one sign to 
% another. Note: This can be done in one line of code but it is 
% trecherousFF. For one scenario the vector has a positive value and then
% a negative value, i.e. v(n) > 0 and v(n + 1) < 0. The root occurs 
% somewhere in between, you can pick either n or n + 1. We could loop 
% through and check this condition at every point - don't do that. Instead 
% think of a way to use logical indexing: You will want to write 
% conditions on the vector and some kind of shifted version of itself. 
% Beware however, when you do this you will have non-overlapping points. 
% It is up to you to figure out what to with them.

% In other file

% Apply your function to the sinc you created. Find the roots (x and y 
% coordinates) and plot them as black circles on top of the sinc using 
% plot(xRoots,yRoots,'ko'). (Make sure your axis is tight.)

apply = signChange(y);

xRoots = x(apply);
yRoots = y(apply);

hold on
plot(xRoots,yRoots,'ko');

% Now we are interested in finding the extremum. (Local minimums and 
% maximums.) Apply your function to the approximate derivative of your 
% sinc to obtain them, then plot them as red stars on top of the sinc 
% using plot(xMinMax,yMinMax,'r*').

dy = diff(y);

local = signChange(dy);
xMinMax = x(local);
yMinMax = y(local);

hold on
plot(xMinMax, yMinMax, 'r*')
%%%