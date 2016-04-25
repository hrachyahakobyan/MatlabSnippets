function [ x ] = descent( func, x0 )
%DESCENT Summary of this function goes here
%   Detailed explanation goes here
% func - function that takes as a single input argument an n-dim VECTOR
% x0 - n-dim vector of starting point
eps = 0.0001;
x = x0;

for u = 1 : 10000000000 
    grad_k = grad(func, x);
    d_k = direction(func, x);
    alpha_k = armijo(func, x, d_k, grad_k);
    x = x + alpha_k .* d_k;
    if (norm(grad_k) < eps )
        break
    end
    
end

end

