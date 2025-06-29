% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 23 de abril de 2025
% Descripción: Dibuja el laberinto en una figura MATLAB; si se le pasa una
%   ruta, la superpone sobre el mapa
%
% Llamado por: principal, solucion
% Llama a: 
% ---------------------------------------------------------------------

function h = mostrarLaberinto(L, ruta)
% Dibuja el laberinto y opcionalmente sobrepone la ruta
    if nargin < 2
        ruta = [];
    end
    h = figure;
    imagesc(L);
    colormap(gray);
    axis equal tight off;
    hold on;
    if ~isempty(ruta)
        plot(ruta(:,2), ruta(:,1), 'b-', 'LineWidth', 2);
    end
    hold off;
end