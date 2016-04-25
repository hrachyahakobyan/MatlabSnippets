function [t, u ] = FEuler( fun, tspan, y0, Nh, p, varargin )
%FEULER Summary of this function goes here
%   Detailed explanation goes here
% Forward Euler method
% fun - the function handle f(t, y(t))
% tspam - the region of integraion
% y0 - initial value, condition
% Nh - number of sections to divide the interval
% p - if 1 - plots the graph

h = (tspan(2) - tspan(1)) / Nh;

y = y0(:);
w = y; u = y.';

tt = linspace(tspan(1), tspan(2), Nh+1);

for t = tt(1:end-1)
    w = w+ h * fun(t,w,varargin{:});
    u = [u; w.'];
end

t = tt';

if p == 1
    figure;
    title('Forward Euler');
    if numel(t) > 10000
    
    h = animatedline;
    axis([t(1) t(end) (min(u)- 2) (max(u) + 2)]);
    for i = 1:numel(t)
      addpoints(h, t(i), u(i));
      drawnow limitrate;
    end
    drawnow;
    end
    if numel(t) < 2000
        h = animatedline;
         axis([t(1) t(end) (min(u)- 2) (max(u) + 2)]);
         for i = 1:numel(t)
         addpoints(h, t(i), u(i));
         drawnow;
         end
    end
end

return


end

 