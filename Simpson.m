function [ v ] = Simpson( f, a, b, n, varargin )
%SIMPSON Summary of this function goes here
%   Detailed explanation goes here


if n == 0
    v = (b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b));
    return
end

h = (b-a) / n;

i = 0:1:n;
x = a + i.*h;

v = 0;

for t = 1 : n 
    v = v + f(x(t)) + 4 * f((x(t) + x(t+1))/2) + f(x(t+1));
end

v = v * 1/6 * h;


end

