% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 15 de abril de 2025
% Descripción: Punto de entrada de la aplicación. Carga el laberinto, 
%   muestra la interfaz de selección de algoritmo, invoca la búsqueda 
%   elegida y visualiza la ruta hallada.
%
% Llamado por: ventana de comandos
% Llama a: mostrarLaberinto, busquedaAnchura, busquedaProfundidad,
%   primeroElMejor, aEstrella, solucion
% ---------------------------------------------------------------------

% Limpiar entorno
clear; clc; close all;

% Cargar laberinto desde fichero .mat
data = load('Lab_Original.mat');
% El laberinto principal se guarda en 'Lab_Original'
if isfield(data, 'Lab_Original')
    L = data.Lab_Original;
elseif isfield(data, 'Lab_Orininal')  % versión con nombre alternativo
    L = data.Lab_Orininal;
else
    error('No se encontró variable Lab_Original en el fichero.');
end

% Mostrar laberinto original
%mostrarLaberinto(L);
% Selección de algoritmo
fprintf('Seleccione algoritmo de búsqueda:\n');
fprintf('  1: Búsqueda en anchura (BFS)\n');
fprintf('  2: Búsqueda en profundidad (DFS)\n');
fprintf('  3: Primero el mejor (Greedy Best-First)\n');
fprintf('  4: A*\n');
op = input('Opción [1-4]: ');

% Ejecutar búsqueda según opción
switch op
    case 1
        ruta = busquedaAnchura(L);
    case 2
        ruta = busquedaProfundidad(L);
    case 3
        ruta = primeroElMejor(L);
    case 4
        ruta = aEstrella(L);
    otherwise
        error('Opción no válida.');
end

% Mostrar la solución sobre el laberinto
mostrarLaberinto(L, ruta);

% Mostrar camino paso a paso
%input('Pulse Enter para mostrar paso a paso...','s');
%solucion(L, ruta);
