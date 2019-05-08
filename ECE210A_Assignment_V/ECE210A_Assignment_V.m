% ECE210A_Assignment_V
% Kevin Kerliu
clear;
close all;
clc;
%%
%%%

load fisheriris;

flowerCellArray = cell(150,1);
temp = deblank(string(species));
for k = 1:150
   flowerCellArray{k,1} = ...
       Flower(meas(k,1),meas(k,2),meas(k,3),meas(k,4),temp(k));
end

check = getSLength(flowerCellArray{25, 1});
if(check == meas(25,4))
    fprintf("WOOHOO\n");
else
    fprintf("WRONG\n");
end

report(flowerCellArray{25,1});
%%%
%%
%%%

% 
% 
%

%%%
%%