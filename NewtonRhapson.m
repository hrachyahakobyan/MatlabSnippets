function [ x_zero, y_zero, n_iter ] = NewtonRhapson(fun, dfun, x_est, eps, max_iter, varargin )
%NEWTONSRHAPSODY Summary of this function goes here
%   Detailed explanation goes here
% x_zero - estimated root
% y_zero - value of fun at x_zero
% n_iter - number of iterations
% fun - the function
% dfun - derivative of the function
% x_est - estimated root
% eps - precision, default 10^(-5)
% max_iter - max iterations, default 10^6


if nargin < 3
    error('Insufficient input arguments')
elseif nargin == 3
    max_iter = 10^6; eps = 10^(-5);
elseif nargin == 4;
    max_iter = 10^6;
end
x = x_est;

fx = fun(x,varargin{:});
dfx = dfun(x, varargin{:});

n_iter = 0;
err = eps + 1;

format long

while err >= eps && n_iter < max_iter
    n_iter = n_iter + 1; 
    err = - fx / dfx;
    x = x + err;
    err = abs(err);
    fx = fun(x,varargin{:});
    dfx = dfun(x, varargin{:});
end

if (n_iter == max_iter && err > eps)
    error('Newtons Rhapsody unsuccessfull')
end

x_zero = x;
y_zero = fx;
   
end

