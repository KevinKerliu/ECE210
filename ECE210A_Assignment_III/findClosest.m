function [val,ind] = findClosest(x,desiredValue)
y = x(:); 
error = abs(y - desiredValue); 
ind = find(error == min(error));
val = y(ind);
end