% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 20 de abril de 2025
% Descripción: Comprueba si la celda de la izquierda está libre y, de ser así,
%   devuelve el nuevo estado; si no, devuelve vacío.
%
% Llamado por: expandir
% Llama a: 
% ---------------------------------------------------------------------

function nuevo = moverIzquierda(L, estado)
    fila = estado(1); col = estado(2);
    if col > 1 && L(fila,col-1) == 0
        nuevo = [fila, col-1];
    else
        nuevo = [];
    end
end