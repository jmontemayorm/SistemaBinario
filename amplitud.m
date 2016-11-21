%----------------------------------------------------------------------%
%Esta funci�n calcula la evoluci�n de la amplitud de la onda gravitacional 
%resultante, en funcion de las condicionaes iniciales y las masas.
%----------------------------------------------------------------------%
function [Ap,Ac,f] = amplitud(t, masa1, masa2, tc, ang, D)
%----------------------------------------------------------------------%
%T0, tiempo de comienzo.
% ang, �ngulo de inclinaci�n.
% D, Distancia en metros del observador.
% t, el vector de tiempo.
% masa1 y masa 2, masas de los agujeros negros en masas solares.
% tc, tiempo para la colisi�n.
%Se calcula ademas las masas relativa y el centro de masa, c es la .
%velocidad de la luz. C es un factor ge�metrico.
%----------------------------------------------------------------------%
T0 = 4.925E-06;    
c = 3.0E+08;       
M = masa1 + masa2;       
masarela = masa1*masa2/(M^2); 
Mc = masarela.^(3/5)*M; 
C = 1;             
%----------------------------------------------------------------------%
%Se invoca a la funci�n para calcular la frecuencua instant�nea.
%----------------------------------------------------------------------%
  f = frecuencia(t, masa1, masa2, tc); 
%----------------------------------------------------------------------%
%Con los siguiente comandos se calcua la evoluci�n de los dos componentes
%de la amplitud de la onda gravitacional, Ac es la componentes cruzada y
%Ap las componente plus.
%----------------------------------------------------------------------%
  Ac = -2*C*T0*c*Mc/D*(2*cos(ang))*(pi*Mc*T0*f).^(2/3);   
  Ap = (1 + cos(ang)^2) .* Ac./(2*cos(ang));                
end