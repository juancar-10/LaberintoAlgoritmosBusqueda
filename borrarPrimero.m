% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 16 de abril de 2025
% Descripción: Elimina el primer elemento de la cola/pila, ajustando la estructura.
%
% Llamado por: busquedaAnchura, busquedaProfundidad
% Llama a: 
% ---------------------------------------------------------------------

function C = borrarPrimero(C)
% Eliminar el primer elemento de la cola
    if ~isempty(C)
        C(1) = [];
    end
end