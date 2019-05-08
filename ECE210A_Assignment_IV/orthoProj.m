function [estVec] = orthoProj(v,Y)
% Create a 1 x size(Y,2) matrix whose columns are just v,
% where size(Y,2) represents the number of columns in Y.
A = repmat(v(:), 1, size(Y,2)); 

% Compute the standard inner product column by column and sum columnwise
% Each entry in the vector a is the orthogonal projection of the vector v
% onto the column vectors y1, y2, ..., yn in matrix Y.
a = sum(conj(Y).*A);

% Multilply to orthonormal set now that we have the appropriate "weights".
estVec = sum(a.*Y, 2);
end