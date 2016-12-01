clear

%Se hace uso de ode15s para invocar la solucion al sistema acoplado.
[t, y] = ode15s(@AuxSistAc, 0.1:0.01:30, [.198, -10]);

%Las condiciones iniciales influira en la amplitud de la solucion para la
%velocidad, ya que nos interesa hacer la comparacion con este nuevo metodo y el ya implementado anteriormente.
figure(1)
plot(t,y(:,1).^2)
xlabel('Tiempo')
ylabel('v^2(t)')