function [ cheby ] = Chebyshev(n, a, b )
%CHEBYSHEV Summary of this function goes here
%   Detailed explanation goes here
% returns a vector of chebyshev nodes of given order
% in the given inteval

if b < a
    temp = a;
    a = b;
    b = temp;
end

if n < 0
    return
end

f = @(n, k) (b-a)/2 * cos((pi*(2*k-1))/(2*n)) + (b+a)/2;

cheby = [];
for k = 1:n
    cheby = [cheby, f(n,k)];
end
       
end

