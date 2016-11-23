%----------------------------------------------------------------------%
% Cálculo del potencial de la onda gravitacional.
%----------------------------------------------------------------------%
function [p] = potencial(t, masa1, masa2, tc)
%----------------------------------------------------------------------%
% T0, tiempo de inicio de la evolución.
% masarela, masa relativa de los agujeros negros.
%----------------------------------------------------------------------%
 T0 = 4.925E-06;
 M = masa1 + masa2;
 masarela = masa1*masa2/(M^2);
%----------------------------------------------------------------------%
% Coeficientes de expansión calculados mediante funciones de Green.
%----------------------------------------------------------------------%
  a0 = 1.0;
  a2 = 3715/8064 + 55/96*masarela;
  a3 = -3*pi/4;
  a4 = 9275495/14450688 + 284875/258048*masarela + 1855/2048*masarela^2;
  theta = (masarela*(tc - t)/(5*M*T0)).^(-1/8);
%----------------------------------------------------------------------%
% Cálculo del potencial mediante los coeficientes de expansión.
%----------------------------------------------------------------------% 
  p = -2/masarela*theta.^(-5).*(a0 + a2*theta.^2 + a3*theta.^3 + a4*theta.^4);
end