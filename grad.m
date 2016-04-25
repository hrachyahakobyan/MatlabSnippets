function [ grad ] = grad( func, x0)
%GRAD Summary of this function goes here
%   Detailed explanation goes here
len = length(x0);
grad = zeros(1,len);

for i = 1:len
    x_t1 = x0;
    x_t1(i) = x_t1(i) + 1e-6;
    grad(i) = (func(x_t1) - func(x0)) / 1e-6;
end


end

