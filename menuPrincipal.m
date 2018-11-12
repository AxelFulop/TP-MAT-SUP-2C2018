%TP MAT SUP 2C2018

%Inicializo las variables de navegacion
volver_atras = 0;
volver_menu_ppal = 1;
sel_menu_ppal = 0;

%Inicializo variables para pedir datos despues
%matriz diagonalmente dominante = [5 2 1; 0 -3 2; -4 1 6]
prompt = {'Ingrese la matriz de coeficientes(A)','Ingrese la matriz de terminos independientes(B)'};
prompt2 = {'ingrese el vector inicial (X)','ingrese la cantidad de decimales','ingrese la cota de error'};
%la matriz [1 2 3; 4 5 6; 7 8 10] no es diagonalmente dominante..

%ejercicio de la catedra...
%[7 -1 4; 3 -8 2; 4 1 -6] A
%[8;-4;3] B
%[0;0;0] X
%e = 0,03

% 1,058  1,001  0,381  jacobi
% 1,064  0,995  0,375  seidel



defaults = {'[7 -1 4; 3 -8 2; 4 1 -6]','[8;-4;3]'};
defaults2 = {'[0;0;0]','3','0.03'};


%Verifico que no elija la opcion finalizar
while (sel_menu_ppal~= 4) 
  
  %Verifico que volvio al menu ppal
  if(volver_menu_ppal == 1)
    sel_menu_ppal = menu('Seleccione una opcion','-Ingresar datos','-Finalizar');
      volver_atras = 0;
      opcion = 0 ;
      volver_menu_ppal = 0;
  end
  
  switch sel_menu_ppal
      case 1
          switch opcion          
              case 0
                  sel_menu_ppal = 1; 
                  dims = inputdlg(prompt,'Ingreso de datos',2, defaults);
                  if(dims{1} == ""  || dims{2} == "" )
                   p=questdlg('No pueden haber campos vacios','TP SUPERIOR','Ok','Ok');
                  switch p
                  case 'Ok'
                  opcion = 0;
                  sel_menu_ppal = 1; 
                  end
                  else
                  A= str2num(dims{1});
                  B= str2num(dims{2});
                  esDominante= matrizDiagonalDominante(A,'');
                  esEstrictamenteDom = matrizDiagonalDominante(A,'estricta');
                  if( esDominante == 1 || esEstrictamenteDom== 1)
                  opcion = 1;
                  else
                  h=questdlg('La matriz debe ser Diagonalmente dominante, vuelva a intentarlo','TP SUPERIOR','Modificar matriz','Volver','Volver');
                  switch h
                  case 'Modificar matriz'
                  sel_menu_ppal = 1; 
                  opcion = 0;
                  case 'Volver'
                  volver_menu_ppal = 1;
                  end
                  end
                  end
              case 1
                  sel_menu1 = menu('Por favor seleccione un metodo:','1) Metodo Jacobi.','2) Metodo gauss-seidel','calcular normas',' -Ingresar nuevos datos - ',' - Finalizar-');
                  switch sel_menu1 
                      case 1
                     dims2 = inputdlg(prompt2,'Ingreso de datos',3, defaults2);
                     X01 = str2num(dims2{1});
                     cantDec1 = str2num(dims2{2});
                     error1 = str2num(dims2{3});
                     sol1 = metodoJacobi(A,B,X01,error1);
                     display(acotDec(cantDec1,sol1));
                     volver_atras = 1;
                      case 2
                      dims2 = inputdlg(prompt2,'Ingreso de datos',3, defaults2);
                     X02 = str2num(dims2{1});
                     cantDec2 = str2num(dims2{2});
                     error2 = str2num(dims2{3});
                    sol2 = metodoSeidel(A,B,X02,error2);
                    display(acotDec(cantDec2,sol2));
                     volver_atras = 1;
                      case 3
                   sel_menu2 = menu('Seleccione una opcion','1)Norma 1','2)Norma 2','3)Norma inf',' - Volver atras-',' -Finalizar- ');
                  switch sel_menu2
                      case 1
                       norm1 = norm(A,1);
                       msgnorm1 = sprintf('el valor de la norma 1 es: %d',norm1);
                       msgbox(msgnorm1,'TP SUPERIOR');
                      case 2
                         norm2 = norm(A,2);
                         msgnorm2 = sprintf('el valor de la norma 2 es: %d',norm2);
                         msgbox(msgnorm2,'TP SUPERIOR');
                      case 3
                         norminf = norm(A,inf);
                         msgnorminf = sprintf('el valor de la norma inf es: %d',norminf);
                         msgbox(msgnorminf,'TP SUPERIOR');
                          
                      case 4
                          volver_atras=1;
                          volver_menu_ppal = 0;
                          
                      case 5
                           
                      break;
                       end
              case 4
                  dims3 = inputdlg(prompt,'Ingreso de datos',2, defaults);
                  A= str2num(dims3{1});
                  B= str2num(dims3{2});   
            case 5
           
              break;                
               end
                  
          end
              
      case 2
         break;
    
      otherwise
        disp('Opcion incorrecta, por favor vuelva a seleccionar otra opcion');
  end
               end

