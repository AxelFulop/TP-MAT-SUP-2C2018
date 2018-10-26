


%Cargo los packages que me van a servir despues
%pkg load control;
%pkg load signal;

%Inicializo las variables de navegacion
volver_atras = 0;
volver_menu_ppal = 1;
sel_menu_ppal = 0;


%Inicializo variables para pedir datos despues
prompt = {'Ingrese la matriz de coeficientes(A)','Ingrese la matriz de incognitas(X)','Ingrese la matriz de terminos independientes(B)'};
defaults = {'[1 2 3; 4 5 6; 7 8 10]','[11;13]','[1;1]'};


%Verifico que no elija la opcion finalizar

while (sel_menu_ppal~= 4) 
  
  %Verifico que volvio al menu ppal
  if(volver_menu_ppal == 1)
    sel_menu_ppal = menu('Seleccione una opcion','-Ingresar datos','-Seleccionar metodo','-Seleccionar otro metodo','-Finalizar');
      volver_atras = 0;
      opcion = 0 ;
      volver_menu_ppal = 0;
  end
  
  
  switch sel_menu_ppal
      case 1
          switch opcion          
              case 0
                  sel_menu_ppal = 1; 
                  dims = inputdlg(prompt,'Ingreso de datos',3, defaults);
                  A= [ 4 5; 1 3];
                  X= dims{2};
                  C= dims{3};
                  esDominante= matrizDiagonalDominante(A,'');
                  esEstrictamenteDom = matrizDiagonalDominante(A,'strict')
                  if( esDominante == 1 || esEstrictamenteDom== 1)
                  opcion = 1;
                  else
                  msgbox('La matriz debe ser Diagonalmente dominante, vuelva a intentarlo', 'TP SUPERIOR','warning');
                  end
              case 1
                  sel_menu1 = menu('Por favor seleccione un metodo:','1) Metodo Jacobi.','2) Metodo gauss-seidel',' - Volver atras - ',' - Ir al menu principal -');
                  switch sel_menu1 
                      case 6
                          volver_atras=1;
                          volver_menu_ppal = 0;
                          opcion = 0;
                      case 7
                          volver_menu_ppal = 1;
                          volver_atras = 0;
                      otherwise
                        opcion = 2;                
                  end
              case 2
                  sel_menu12 = menu('Seleccione una opcion',' - Volver atras -',' - Ir al menu principal - ');
                  switch sel_menu12
                      case 1
                        
                          volver_menu_ppal = 1;
                      case 2
                         
                          volver_menu_ppal = 1;
                      case 3
                          
                          volver_menu_ppal = 1;
                      case 4
                          volver_atras=1;
                          volver_menu_ppal = 0;
                          opcion = 1;
                      case 5
                          volver_menu_ppal = 1;
                          volver_atras = 0;
                  end
              end
              
              
      case 2
          disp('Opcion 2');
          dims = inputdlg (prompt,'Ingreso de datos',3, defaults);
          volver_menu_ppal = 1;
      case 3
          disp('Opcion 3')
          volver_menu_ppal = 1;
      case 4
      otherwise
        disp('Opcion incorrecta, por favor vuelva a seleccionar otra opcion');
  end
end

function flag = matrizDiagonalDominante( A, strOpt )

    if nargin == 1
        strOpt = ''; 
    elseif nargin ~= 2
        error('domdiag: invalid input parameters');
    end
    
    [ m , n ] = size(A);
    if m ~= n
        error('domdiag: input matrix must have dimension rows==cols');
    end
    
    absDiag  = abs(diag(A));
   
    absElem = sum(abs(A), 2) - absDiag;
    
    flag = all(absElem <= absDiag);
    
    
    if strcmpi(strOpt, 'strict') && flag == true
        flag = any(absElem  < absDiag);
    end
    
end
