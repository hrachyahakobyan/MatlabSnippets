function [ v ] = Midpoint( f, a, b, n, varargin )
%MIDPOINT Summary of this function goes here
%   Detailed explanation goes here

if n == 0
    v = (b-a) * f((a+b)/2);
    return;
end

h = (b-a) / n;
v = 0;
i = 1;

for t = 1 : n
    v = v + f(a + i*h / 2);
    i = i + 2;
end

v = v * h;

end

