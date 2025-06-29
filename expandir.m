% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 18 de abril de 2025
% Descripción: A partir de un estado (fila, columna), genera todos los 
%   sucesores válidos aplicando las acciones de movimiento.
%
% Llamado por: busquedaAnchura, busquedaProfundidad, primeroElMejor,
%   aEstrella
% Llama a: moverArriba, moverAbajo, moverIzquierda, moverDerecha
% ---------------------------------------------------------------------

function sucesores = expandir(L, estado)
% Dado el laberinto L y un estado [fila, col], devuelve cell array de estados sucesores
    acciones = {@moverArriba, @moverAbajo, @moverIzquierda, @moverDerecha};
    sucesores = {};
    for k = 1:numel(acciones)
        nuevo = acciones{k}(L, estado);
        if ~isempty(nuevo)
            sucesores{end+1} = nuevo;
        end
    end
end