
function [Y] = gramSchmidt(X)
% X is our input matrix, a set of linearly independent vectors
% Y is our output matrix, a set of orthonormal vectors obtained 
% via the Gram Schmidt Algorithm

[m,n] = size(X); % Gets the size of the input matrix, X
Y = zeros(m,n); % Pre-allocation of space for output matrix, Y
c = zeros(1,n); % Pre-allocation of space for coefficient vector, c

% Gram Schmidt Algorithm
for k = 1:n
    Y(:,k) = X(:,k);
    if k ~= 1
        % Compute the coefficient vector, c for the given vector. 
        % That is, find its onto the other vectors.
        
        % 1. Coefficient computation, the standard inner product. The 
        % coefficients represent the orthogonal projection of the given
        % vector onto each vector in the orthonormal set, Y.
        c = conj(X(:,k)'*Y(:,1:k-1)); 
        
        % 2. Elementwise multiplication of coefficients and orthonormal
        % vectors.
        c = sum(c.*Y(:,1:k-1),2);
        
        % Subtract off the components of the given vector that are parallel
        % to vectors in the orthonormal set, X.
        Y(:,k) = X(:,k) - c;
    end
    Y(:,k) = Y(:,k)/norm(Y(:,k)); % Normalize
end

