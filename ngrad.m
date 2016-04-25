function [df] = ngrad(func, X, h)
df = zeros(length(X), 1);
for i=1:length(X)
    x1 = X;
    x2 = X;
    x1(i) = X(i) - h;
    x2(i) = X(i) + h;
    y1 = func(x1);
    y2 = func(x2);
    df(i) = (y2 - y1) / (2*h);
end
end

