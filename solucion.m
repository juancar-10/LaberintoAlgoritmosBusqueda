% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 22 de abril de 2025
% Descripción: Visualiza la ruta paso a paso sobre el laberinto, 
%   marcando cada posición con un cuadrado rojo.
%
% Llamado por: principal
% Llama a: mostrarLaberinto
% ---------------------------------------------------------------------

function solucion(L, ruta)
% Muestra paso a paso la ruta sobre el laberinto
    figure;
    mostr = mostrarLaberinto(L);
    hold on;
    for i = 1:size(ruta,1)
        plot(ruta(i,2), ruta(i,1), 'rs', 'MarkerSize', 12, 'MarkerFaceColor', 'r');
        pause(0.2);
    end
    hold off;
end