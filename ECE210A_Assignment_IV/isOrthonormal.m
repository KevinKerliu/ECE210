function retval = isOrthonormal(Y)
% Our threshold
threshold = eps(100);
% Number of vectors
[~, n] = size(Y); 
% All possible indicies via cartesian product
[N1, N2] = meshgrid(1:n, 1:n);
% Upper triangular indices
N2 = nonzeros(triu(N2,1));
N1 = nonzeros(triu(N1,1));
% Compute dot products
c = dot(Y(:,N2),Y(:,N1));
% Logical evaluation to determine which terms are larger than the
% threshold and tell us whether or not the set is orthonormal.
retval = double(~any(abs(c) > threshold)); 
end


% bool = norm(vecnorm(Y*Y' - eye(size(Y,1)))) < 1000*eps;

% If we have a matrix whose columns form an orthonormal set, then 
% multiplying that matrix by its conjugate transpose will yield the
% identity matrix. If we do not obtain the identity, then the product will
% not be the identity matrix.

% In this check, we see if the difference between the resultant matrix Y*Y'
% and the identity is zero, with a fudge factor of eps*1000 to 
% account for potential floating point error / tolerance.

% If the norm of the difference is zero (or around it), then we return that
% it is orthonormal.
% If the norm of the difference is nonzero, then we return that it is not
% orthonormal.