% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 22 de abril de 2025
% Descripción: Verifica si un estado corresponde a la meta.
%
% Llamado por: busquedaAnchura, busquedaProfundidad, primeroElMejor,
%   aEstrella
% Llama a: 
% ---------------------------------------------------------------------

function goal = testObjetivo(L, estado)
% Comprueba si el estado es la esquina inferior derecha
    [nFilas, nCols] = size(L);
    goal = isequal(estado, [nFilas, nCols]);
end
