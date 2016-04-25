function [ t, u ] = Heun( fun, tspan, y0, Nh, varargin )
%   HEUN Summary of this function goes here
%   Detailed explanation goes here
%   Heun's method for numerical solution of differential equations



h = (tspan(2) - tspan(1)) / Nh;

y = y0(:);
w = y;
u = y.';

tt = linspace(tspan(1), tspan(2), Nh+1);

for t = tt(1:end-1)
    k1 = fun(t,w, varargin{:});
    k2 = fun(t,w+h.*k1, varargin{:}); 
    w = w + h/2 .* (k1 + k2);
    u = [u; w.'];
end

t = tt';

end
