function [x_res, n_iter ] = FPI_1(x_0, f, tol, iter_max, varargin )
%FPI Summary of this function goes here
%   Detailed explanation goes here
% The error estimated is made by calculating the absolute value of
% x(n+1) - x(n)
if nargin < 2
    error('Insufficient input arguments');
elseif nargin == 2
    iter_max = 10^6; tol = 10^(-6);
elseif nargin == 3
    iter_max = 10^6;
end
 
x = [x_0, f(x_0)];
fx = f(x, varargin{:});

err = tol + 1;
n_iter = 0;

format long

while err > tol && n_iter < iter_max

x(1) = x(2);
x(2) = fx(2);
fx = f(x, varargin{:});
err = abs(x(2) - x(1));
n_iter = n_iter +1;
    
end

x_res = x(2);

if n_iter == iter_max && err > tol
    fprintf(['FPI reached max iterations without converging to ',...
         'specified limits ',...
         'iteration  %i; ',...
         'x  %i; '], n_iter, x_res);
else
    fprintf(['the method converged at iteration %i ',...
            'with x %i; '], n_iter, x_res);
end
end





