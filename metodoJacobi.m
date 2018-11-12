
%Funcion que me permite calcular las soluciones de un sistema
%Se utiliza el metodo de paro del error
%Se puede utilizar un metodo de paro que sea hasta unas n iteraciones
%maximas?
function [res] = metodoJacobi(A,B,X0,error)
D= diag(diag(A));
L = tril(A,-1);
U = triu(A,1);
x1 = 1;
xi = X0;
while max(abs(x1-xi)) > error
x1 = -inv(D) * (L+U) * X0 + inv(D)*B;
xi = X0;
X0 = x1;
end
res = x1;
end