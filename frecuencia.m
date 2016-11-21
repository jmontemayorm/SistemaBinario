%----------------------------------------------------------------------%
% Calculo de la frecuencia de la onda gravitacional.
%----------------------------------------------------------------------%
function [f]=frecuencia(t, masa1, masa2, tc)
%----------------------------------------------------------------------%
%T0, tiempo de inicio de la evolución.
%masarela,masare lativa de los agujeros negros.
%gamma, coeficiente gamma.
%theta, formula para el ángulo theta.
%----------------------------------------------------------------------%
 T0 = 4.925E-06;    
 M = masa1 + masa2;       
 masarela = masa1*masa2/(M^2); 
 gamma = 0.577216;  
 theta = (masarela*(tc - t)/(5*M*T0)).^(-1/8);
%----------------------------------------------------------------------%
%Coeficientes de expansión calculados mediante funciones de Green.
%----------------------------------------------------------------------%

  a2 = 743/2688 + 11/32*masarela;
  a3 = -3*pi/10;
  a4 = 1855099/14450688 + 56975/258048*masarela + 371/2048*masarela^2;
  a5 = (7729/21504 - 13/256*masarela)*pi;
  a6= - 720817631400877/288412611379200 + 53/200*pi^2 + 107/280*gamma + ...
( 25302017977/4161798144 - 451/2048*pi^2)*masarela - 30913/1835008*masarela^2 ...
+235925/1769472*masarela^3 + 107/280*log(2.*theta);
  a7 = (-188516689/433520640 - 97765/258048*masarela + 141769/1290240*masarela^2)*pi;
%----------------------------------------------------------------------%
%Calculo de la frecuencia mediante los coeficientes de expansión.
%----------------------------------------------------------------------%  
  f = theta.^3/(8*pi*M*T0).*(1 + a2*theta.^2+ a3*theta.^3 + a4*theta.^4 + ...
a5*theta.^5 + a6.*theta.^6 ...
+ a7*theta.^7);
end