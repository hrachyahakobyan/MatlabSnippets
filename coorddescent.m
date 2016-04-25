function [ xmin ] = coorddescent( f, xstart )
%DIRDESCENT Summary of this function goes here
%   Detailed explanation goes here
xmin = xstart;

tol = 0.0001;
eps = 0.0001;

l = length(xmin);


it = 1;
val = 1;
while val > eps && it < 10000000
    for j = 1 : l
    vec = sym('x', [1 l]);
    for i = 1 : l
        if i ~= j
            vec(i) = xmin(i);
        end
    end
    g = matlabFunction(f(vec));
    minp = newtonmin(g, xmin(j));
    xtemp = xmin;
    xmin(j) = minp;
    val = norm(xtemp - xmin);
    clear vec;
    it = it + 1;
    end
end

end

