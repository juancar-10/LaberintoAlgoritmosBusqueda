% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 16 de abril de 2025
% Descripción: Inserta todos los elementos de una lista (cell array) al final de la cola/pila a la vez.
%
% Llamado por: busquedaAnchura, primeroElMejor, aEstrella
% Llama a: inserta
% ---------------------------------------------------------------------

function C = insertarTodo(C, lista)
% Insertar todos los elementos de 'lista' (cell array) al final de la cola
    for i = 1:numel(lista)
        C = inserta(C, lista{i});
    end
end