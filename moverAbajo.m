% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 19 de abril de 2025
% Descripción: Comprueba si la celda inferior está libre y, de ser así, 
%   devuelve el nuevo estado; si no, devuelve vacío.
%
% Llamado por: expandir
% Llama a: 
% ---------------------------------------------------------------------

function nuevo = moverAbajo(L, estado)
    [nFilas, ~] = size(L);
    fila = estado(1); col = estado(2);
    if fila < nFilas && L(fila+1,col) == 0
        nuevo = [fila+1, col];
    else
        nuevo = [];
    end
end