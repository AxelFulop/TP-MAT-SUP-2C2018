 function flag = matrizDiagonalDominante( A, strOpt )

    if nargin == 1
        strOpt = ''; 
    elseif nargin ~= 2
        error('TP SUPERIOR:argumentos invalides');
    end
    
    [ m , n ] = size(A);
    if m ~= n
        error('TP SUPERIOR: la matriz debe ser de nxm');
    end
    
    absDiag  = abs(diag(A));
   
    absElem = sum(abs(A), 2) - absDiag;
    
    flag = all(absElem <= absDiag);
    
    
    if strcmpi(strOpt, 'estricta') && flag == true
        flag = any(absElem  < absDiag);
    end
    
end
