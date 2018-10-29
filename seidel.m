% METODO ITERATIVO DE GAUSS SEIDEL

function [] = seidel(a,b,x,iter,tol)

k=norm(a)*norm(a^-1);%Se calcula el condicional de la matriz de coeficientes
determinante=det(a);%se calcula el determinante de la matriz de coeficiente
if determinante==0
 p=questdlg('El determinante es cero, el problema no tiene solución única','TP SUPERIOR','Ok','Ok');
 switch p
 case 'Ok'
 end
 exit;
 end

n=length(b); %numero de elementos del vector b
d=diag(diag(a)); %obtencion de la matriz diagonal
l=d-tril(a); %obtencion de la matriz diagonal superior L
u=d-triu(a); %obtencion de la matriz diagonal inferior u

T=((d-l)^-1)*u; % matriz de transicion de gauss
disp(T)
re=max(abs(eig(T))); %calculo del radio espectral

if re>1
return
end
C=((d-l)^-1)*b; % vector constante C, para el metodo
disp(C)
i=0;

err=tol+1;
z=[i,x(1),x(2),x(3),err]; %vector que me permite graficar la tabla

while err>tol && i<iter
  xi=T*x+C;
%disp(xi)
i=i+1;
err=norm(xi-x); %norma 2
%err=max(abs(xi-x)); %norma 1
%err=norm(xi-x)/norm(xi); %norma relativa

x=xi;
z(i,1)=i; 
z(i,2)=x(1); 
z(i,3)=x(2); 
z(i,4)=x(3);
z(i,5)=err;
end
fprintf('\nTABLA:\n\n    n                  x1                  x2                  x3                 Error\n\n   ')
disp(z) %impresion de la tabla.