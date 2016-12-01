function dydt = AuxSistAc(t, y)

%Se inicializa la solucion al sistema de ecuaciones diferenciales
%acoplados.

n = 0.25;
M = 2.4;

%Se escriben las constantes.
F5 = -1*(((8191)/(672))+((583)/(24))*n)*pi;
F7 = -1*(((16285)/(504))-((214754)/(1728))*n-((193385)/(3024))*n^(2))*pi;

%Estas ecuaciones son las propuestas por el metodo de expansion, las cuales
%son usadas para resolver el sistema y asi poder obtener la velocidad en
%funcion del tiempo, y despues la graficacmos al cuadrado para comparar con
%el resultado analitico.
dE = @(v) (v.^2.*((816334744563213*v.^5)/140737488355328 + (1069*v.^3)/96 - (13*v)/24))/8 + (v.*((272111581521071*v.^6)/281474976710656 + (1069*v.^4)/384 - (13*v.^2)/48))/4;
F = @(v) ((32)/(5))*n^(2)*v.^(10).*(1-1*(((1247)/(336))+((35)/(12))*n)*v.^2-4*pi*v.^3+F5*v.^5+(((6643739519)/(69854400))+((16)/(3))*pi^(2)-((1712)/(105))*0.577216+(((41)/(48))*pi^(2)-...
((134543)/(7776)))*n-((94403)/(3024))*n^(2)-((775)/(324))*n^(3)-((856)/(105))*log(16*v.^(2))).*v.^6+F7*v.^7);

%Se define el sistema.
dydt = [(y(1).^3)./M; ... % d\phi/dt
    -F(y(1))./(M.*dE(y(1)))]; % dv/dt

end
