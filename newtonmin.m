function [ xmin ] = newtonmin( func, xstart )
%NEWTONMIN Summary of this function goes here
%   Detailed explanation goes here
xmin = xstart;
tol = 0.0001;
eps = 0.0001;
H = nhessian(func, xmin, tol);
g = ngrad(func, xmin, tol);

if (rank(H) < length(H))
    fprintf('Singular Hessian, try other starting point');
    return;
end

val = H\g;
it = 0;
while norm(val) > eps && it < 10000000
    it = it + 1;
    H = nhessian(func, xmin, tol);
    if (rank(H) < length(H))
        fprintf('Singular Hessian, try other starting point');
    return;
    end
    g = ngrad(func, xmin, tol);
    val = H\g;
    xmin = xmin - val';
end
    

end



