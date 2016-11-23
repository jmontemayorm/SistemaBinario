%-----------------------EJEMPLO DE PRUEBA------------------------------%
%El siguiente código simula la evolución de un sistema binario de agujeros
%negros de schwarzschild, desde sus condiciones iniciales hasta su colpaso
%Se gráfica el potencial del sistema, la evolución de la onda y la frecuencia.
%Autores:
%Javier Montemayor Mancías - A01196276
%Diego Rubén Machain Rivera - A01232074
%Juan José Silva Cuevas - A00398095
%Manuel Alberto Ortiz Valle - A00815494
%Ricardo Castro Yarza - A00816563
%----------------------------------------------------------------------%
clear all
clc
%----------------------------------------------------------------------%
%masa 1 y masa 2, son las masas de los agujeros medidas en masas solares
%fremu, frecuencia de muestreo medida en Hz.
% tc, tiempo de referencia para colisión.
%ang, angulo de inclinación.
% f0, frecuencia máxima.
% dt, tiempo de muestra del tiempo.
% N, número de datos tomada del producto de la frecuencia y el tiempo.
%----------------------------------------------------------------------%
masa1 = 1.2;          
masa2 = 1.2;          
fremu = 2048;      
tc = 32.0;         
ang = 0.0;           
f0 = 40.0;         
dt = 1/fremu;      
N = floor(fremu*tc);   
t = [0:N-1].'*dt;      
%----------------------------------------------------------------------%
%En las siguientes líneas se grafica el potencial de la onda gravitacional
%producida por el movimiento brusco de grandes cantitades de masa.Esto
%debido al movimiento de atracción de los agujeros
%----------------------------------------------------------------------%
[h, p, f] = onda(t, masa1, masa2, tc, ang, f0);
figure;
plot(t, p);
axis tight
xlabel('Time (sec)');
ylabel('Potencial');
title('Onda Gravitacional');
%----------------------------------------------------------------------%
%Evolución de la frecuencua de la onda gravitacional en función del 
%tiempo.
%----------------------------------------------------------------------%
figure; plot(t, f);
axis tight
xlabel('Tiempo');
ylabel('Frecuencia de la onda');
%----------------------------------------------------------------------%
%Evolución de la metrica lineal en función del tiempo, esto esta ,
%relacionado con la intensidad de la deformación del espacio-tiempo.
%----------------------------------------------------------------------%
figure; plot(t, h);
axis tight
xlabel('Tiempo');
ylabel('Onda Gravitacional');
%----------------------------------------------------------------------%
%Gráfico del espectro de la frecuencia.
%----------------------------------------------------------------------%
figure;
Nfft = 512;
spectrogram(h, Nfft, fremu, Nfft/2);
%----------------------------------------------------------------------%
