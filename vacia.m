% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 16 de abril de 2025
% Descripción: Comprueba si la cola/pila está vacía.
%
% Llamado por: busquedaAnchura, busquedaProfundidad
% Llama a: 
% ---------------------------------------------------------------------

function f = vacia(C)
% Devuelve true si la cola está vacía
    f = isempty(C);
end