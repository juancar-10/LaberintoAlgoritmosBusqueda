% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 23 de abril de 2025
% Descripción: Calcula la distancia Manhattan desde cualquier posición 
%   hasta la esquina inferior derecha.
%
% Llamado por: primeroElMejor, aEstrella
% Llama a: 
% ---------------------------------------------------------------------

function h = heuristica(estado, dims)
% Distancia Manhattan desde estado=[i,j] hasta esquina inferior derecha
    h = abs(dims(1) - estado(1)) + abs(dims(2) - estado(2));
end