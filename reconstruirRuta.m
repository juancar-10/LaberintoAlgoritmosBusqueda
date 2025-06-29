% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 3 de mayo de 2025
% Descripción: A partir de un mapa de padres, reconstruye paso a paso la 
%   ruta desde el inicio hasta el estado objetivo.
%
% Llamado por: busquedaAnchura, busquedaProfundidad, primeroElMejor,
%   aEstrella
% Llama a:
% ---------------------------------------------------------------------

function ruta = reconstruirRuta(padres, estado)
% Reconstruye ruta desde inicio hasta 'estado' usando mapa de padres
    ruta = estado;
    key = sprintf('%d_%d', estado);
    while true
        pstr = padres(key);
        if isempty(pstr), break; end
        parts = sscanf(pstr, '%d_%d');
        est = [parts(1), parts(2)];
        ruta = [est; ruta];
        key = pstr;
    end
end