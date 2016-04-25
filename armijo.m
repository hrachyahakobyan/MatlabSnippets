function [ alpha_k ] = armijo( func, x_k, d_k, grad_k )
%ARMIJO Summary of this function goes here
%   Detailed explanation goes here
alpha_k = 1;
r = 0.5;
eps = 0.1;

while func(x_k + alpha_k .* d_k) > (func(x_k) + (alpha_k*eps)*dot(grad_k, d_k))
    alpha_k = alpha_k * r;
end

end

