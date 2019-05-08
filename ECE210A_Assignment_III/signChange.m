function SC = signChange(v)
w = (v >= 0);
original = w(1:end-1);
shifted = w(2:end);
SC = find(xor(original, shifted));
end