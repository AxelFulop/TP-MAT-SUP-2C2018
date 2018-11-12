function [res] = acotDec (decimales,funcion)
s = strcat('%12.',num2str(decimales));
s2 = strcat(s,'f');
res = sprintf(s2,funcion);
end
                     