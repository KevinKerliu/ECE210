% ECE210A_Assignment_I
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

% Question 1 
% Create four scalar variables with the values:
% - ln(9)
% - arcsin(e^-9) x 10^4
% - log10(2PI/9)
% - 9 + j
% Give these variables reasonable and unique names! Then make a column
% vector containing each of these four values in order as entries. Do this
% using variable names, i.e. don't just copy and paste the mathematical
% expressions.

whippersnapper = log(9);
tallywacker = asin(exp(-9))*10^4;
lollygagger = log10(2*pi/9);
scalawag = 9 + 1j;

periwinkle = [whippersnapper; tallywacker; lollygagger; scalawag];

%%%
%%
%%%

% Question 2
% Compute the real part, imaginary part, magnitude and phase of the complex
% variable from Question 1. Store these four values as variables, then
% create a row vector with these values as entries. Once again, do this
% using variable names.

realScalawag = real(scalawag);
imagScalawag = imag(scalawag);
magScalawag = abs(scalawag);
phaseScalawag = angle(scalawag);

malarkey = [realScalawag, imagScalawag, magScalawag, phaseScalawag];

%%%
%%
%%%

% Question 3
% You now have two vectors of length 4, but one is a row vector and one is
% a column vector. Multiply these two vectors in both orders, giving you
% two arrays of different sizes. Store these values in variables.

op1 = periwinkle*malarkey;
op2 = malarkey*periwinkle;

%%%
%%
%%%

% Question 4 
% Still using the vectors from Questions 1 and 2, transpose one of them so
% that both are column vectors (be sure to only conduct the regular
% transpose, not conjugate transpose). Now find the elementwise product of
% these two vectors, which will itself be a length 4 coimagScalawaglumn vector. Using
% repmat, create a 4v4 matrix whose columns are each this vector.

malarkeyT = malarkey.';
elementWiseMult = malarkeyT.*periwinkle;

repmatMatrix = repmat(elementWiseMult, 1, 4);

%%%
%%
%%%

% Question 5
% From Questions 3 and 4 you should have two 4v4 matrices. Perform the
% following operations on these matrices and store the outputs as
% variables:
% - Matrix multiplication in either order
% - Elementwise multiplcation
% - Conjugate transpose of either matrix
% - Inverse of the sum of either matrix with the 4x4 identity
% - Square of either matrix

part1orderA = op1*repmatMatrix;
part1orderB = repmatMatrix*op1;
part2 = op1.*repmatMatrix;
part3matrixA = op1';
part3matrixB = repmatMatrix';
part4matrixA = inv(op1 + eye(4));
part4matrixB = inv(repmatMatrix + eye(4));
part5matrixA = op1^2;
part5matrixB = repmatMatrix^2;  

%%%
%%
%%%

%Question 6
% One of your vector multiplies from Question 3 should have given you a
% complex scalar. Use the MATLAB function fix (use doc to see exactly what
% this does) to round down the real part of this value. Store this natural
% number as a variable called n. Create two vectors: one containing 1000
% evenly spaced points between 1 and n, the second containing values
% between 1 and n spaced in intervals of size 0.1. Use the more natural of
% the colon operator or linspace to cerate these vectors; you should wind
% up using both!
% 
n = fix(real(op2));
vectorA = linspace(1, n, 1000);
vectorB = 1:0.1:n;

%%%