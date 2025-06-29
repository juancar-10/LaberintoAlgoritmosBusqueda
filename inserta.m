% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 16 de abril de 2025
% Descripción: Añade un elemento al final de la cola/pila.
%
% Llamado por: busquedaAnchura, busquedaProfundidad, insertarTodo
% Llama a: 
% ---------------------------------------------------------------------

function C = inserta(C, elemento)
% Insertar un elemento al final de la cola
    C{end+1} = elemento;
end