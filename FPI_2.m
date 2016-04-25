function [x_res, n_iter ] = FPI_2(x_0, g1, g2, tol, max_iter, varargin )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%  x_0 - initial guess
% g1, g2 - the functions of x1 and x2
% uses Euclidean distance for error estimate

if nargin < 3
    error('Insufficient input arguments')
elseif nargin == 3
    tol = 10^(-6); max_iter = 10^6;
elseif nargin == 4
    max_iter = 10^6;
end

x = x_0;

n_iter = 0;
err = tol + 1;

while err > tol && n_iter < max_iter
    
x_prev = x;
x(1) = g1(x_prev(1), x_prev(2));
x(2) = g2(x_prev(1), x_prev(2));
n_iter = n_iter + 1;
err = norm(x - x_prev);

end

x_res = x;

if n_iter == max_iter && err > tol
    fprintf(['FPI reached max iterations without converging to ',...
         'specified limits ',...
         'iteration  %i; ',...
         'x1 %i, x2 %i;'], n_iter, x_res(1), x_res(2));
else
    fprintf(['the method converged at iteration %i ',...
            'with x1 %i, x2 %i; '], n_iter, x_res(1), x_res(2));
end

end

