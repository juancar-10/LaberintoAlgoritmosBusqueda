% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 27 de abril de 2025
% Descripción: Greedy Best-First Search: mantiene una lista de apertura 
%   ordenada por heurística Manhattan, expande siempre el nodo más “prometedor”
%   acorde a la heurística.
%
% Llamado por: principal
% Llama a: heuristica, expandir, testObjetivo, reconstruirRuta,
%   insertarTodo
% ---------------------------------------------------------------------

function ruta = primeroElMejor(L)
    % Greedy Best-First: expande nodo con menor heurística (distancia Manhattan)
    inicio = [1,1];
    % Cada entrada de apertura tiene campos: .pos y .h
    apertura = {struct('pos', inicio, 'h', heuristica(inicio, size(L)))};
    %Mapa de padres para la reconstrucción de la ruta
    padres = containers.Map;
    padres(sprintf('%d_%d', inicio)) = '';
    %Estructura de visitados
    visitado = false(size(L)); 
    visitado(1,1) = true;
    while ~isempty(apertura)
        % Extraer el nodo con menor heurística
        [~, idx] = min(cellfun(@(n)n.h, apertura));
        nodo = apertura{idx}; apertura(idx) = [];
        s = nodo.pos;
        % Si es objetivo, reconstruir ruta
        if testObjetivo(L, s)
            ruta = reconstruirRuta(padres, s);
            return;
        end
        % Expandir sucesores
        suc = expandir(L, s);
        nuevos = {};
        for i = 1:numel(suc)
            v = suc{i}; keyV = sprintf('%d_%d', v);
            if ~visitado(v(1), v(2))
                padres(keyV) = sprintf('%d_%d', s);
                visitado(v(1), v(2)) = true;
                 % Precomputar h(v) y acumular
                nuevos{end+1} = struct('pos', v, 'h', heuristica(v, size(L)));
            end
        end
        % Insertar todos los sucesores y dejarlos listos para selección
        apertura = insertarTodo(apertura, nuevos);
    end
    ruta = []; %Sin solución
end