function [res] = metodoSeidel(A,B,X0,error)
D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
err = 1;
x1 = 1;
xi = X0;

while err > error
x1 = -inv(D+L) * U * X0 + inv(D +L)*B;
err = sum(abs(x1-xi));
xi = X0;
X0 = x1;
end
res = x1;
end
