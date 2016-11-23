%----------------------------------------------------------------------%
% Esta función junta todas la funciones que describen la onda gravitacional
% en una sola. En ella se invoca a la amplitud de la onda, su frecuencia y
% potencial también.
%----------------------------------------------------------------------%
function [h, p, f, Ap, Ac] = onda(t, masa1, masa2, tc, ang, f0)
%----------------------------------------------------------------------%
% Distancia en metros del observador al sistema.
% Se invoca al potencial, la amplitud y la resultante de los componentes de 
% de la onda.
%----------------------------------------------------------------------%
  D = 1.0;  
  p = potencial(t, masa1, masa2, tc);
  [Ap, Ac, f] = amplitud(t, masa1, masa2, tc, ang, D);
  h = Ap.*cos(p) + Ac.*sin(p);
%----------------------------------------------------------------------%
% Se cortan todos los resultados obtenidos para tiempos posteriores a 
% la colisión de los hoyos negros por perdidas de energía.
%----------------------------------------------------------------------%
  h(t >= tc) = 0;
  p(t >= tc) = 0;
  f(t >= tc) = 0;
  Ap(t >= tc) = 0;
  Ac(t >= tc) = 0;
%----------------------------------------------------------------------%
% Se cortan todas las frecuencias menores a la frecuencia de muestra, ya
% que esas frecuencias son imposibles de detectar. Al final se normaliza
% los valores de la onda resultante.
%----------------------------------------------------------------------%
  h(f < f0) = 0;
  p(f < f0) = 0;
  f(f < f0) = 0;
  Ap(f < f0) = 0;
  Ac(f < f0) = 0;
  h = h/norm(h);
end
