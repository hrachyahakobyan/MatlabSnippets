function [x_zero, y_zero, n_iter, finalA, finalB] = Bisection(fun, a, b, eps, max_iter, varargin)
%BISECTION Summary of this function goes here
%   Detailed explanation goes here
% fun - the handle to the function
% a, b - endpoints of the interval
% eps - the precision, if not specified, default set to 10^-5
% max_iter - maximum iterations allowed, if not specified, default set to
% 10^6

% x_zero - the estimated root
% y_zero - value of the function at the estimated root
% n_iter - number of iterations performed
x = [a, (a+b) * 0.5, b];
fx = fun(x, varargin{:});
finalA = x(1);
finalB = x(3);

if nargin == 4
    max_iter = 10^6;
elseif nargin == 3
    max_iter = 10^6; eps = 10^(-5);
elseif nargin < 3
    error('Insufficient input arguments');
end

if fx(1) * fx(3) > 0
    error('Invalid endpoints');
elseif fx(1) == 0
    x_zero = a; y_zero = 0; n_iter = 0; return
elseif fx(3) == 0
    x_zero = b; y_zero = 0; n_iter = 0; return
end


% swap a and b if needed
if a > b
    temp = b; b = a; a = temp; finalA = a; finalB = b;
end

n_iter = 0;
err = (b-a) * 0.5;

format long

while err >= eps && n_iter < max_iter
    n_iter = n_iter + 1;
    if fx (1)* fx(2) < 0
         x(3) = x(2);
         x(2) = x(1)+(x(3)-x(1))*0.5;
         fx = fun(x,varargin {:});
         err = (x(3)-x(1))*0.5;
         finalA = x(1); finalB = x(3);
     elseif fx (2)* fx (3) < 0
         x(1) = x(2);
         x(2) = x(1)+(x(3)-x(1))*0.5;
         fx = fun(x,varargin {:});
         err = (x(3)-x(1))*0.5;
         finalA = x(1); finalB = x(3);
     else
         x(2) = x(fx == 0); err = 0;
     end
end

if (n_iter == max_iter && err > eps)
    error('Bisection method unsuccessfull. Did not converge')
end
x_zero = x(2);
x = x(2);
y_zero = fun(x,varargin {:});
return

end

