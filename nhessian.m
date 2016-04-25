function [H] = num_hess(func, X, h)

H = zeros(length(X));
for i=1:length(X)
    x1 = X;
    x1(i) = X(i) - h;
    df1 = ngrad(func, x1, h);
    x2 = X;
    x2(i) = X(i) + h;
    df2 = ngrad(func, x2, h);
    d2f = (df2-df1) / (2*h);
    H(i,:) = d2f';
end

end