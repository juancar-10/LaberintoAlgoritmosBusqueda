% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 28 de abril de 2025
% Descripción: Algoritmo A*: expande nodos según f = g + h, donde g es el
% c oste acumulado y h la heurística de Manhattan
%
% Llamado por: principal
% Llama a: heuristica, expandir, testObjetivo, reconstruirRuta, insertarTodo
% ---------------------------------------------------------------------

function ruta = aEstrella(L)
    % A*: expande según f = g + h (g = coste acumulado)
    inicio = [1,1];
    apertura = {struct('pos', inicio, 'g', 0, 'h', heuristica(inicio, size(L)))};
    padres = containers.Map;
    padres(sprintf('%d_%d', inicio)) = '';
    % gMap guarda el coste g actual más bajo por cada posición
    gMap = containers.Map; gMap(sprintf('%d_%d', inicio)) = 0;
    while ~isempty(apertura)
         % Calcular f = g + h para cada nodo y extraer el mínimo
        fvals = cellfun(@(n)n.g + n.h, apertura);
        [~, idx] = min(fvals);
        nodo = apertura{idx}; apertura(idx) = [];
        s = nodo.pos;
         % Si llegamos a la meta, reconstruimos ruta
        if testObjetivo(L, s)
            ruta = reconstruirRuta(padres, s);
            return;
        end
        % Expandir sucesores
        suc = expandir(L, s);
        nuevos = {};
        for i = 1:numel(suc)
            v = suc{i}; keyV = sprintf('%d_%d', v);
            tentative_g = nodo.g + 1; % coste unitario por movimiento
            % Si no existe g(v) o encontramos un camino mejor
            if ~isKey(gMap, keyV) || tentative_g < gMap(keyV)
                padres(keyV) = sprintf('%d_%d', s);
                gMap(keyV) = tentative_g;
                nuevos{end+1} = struct('pos', v, 'g', tentative_g, 'h', heuristica(v, size(L)));
            end
        end
        % Insertamos todos los sucesores con su f implícito
        apertura = insertarTodo(apertura, nuevos);
    end
    ruta = []; %Sin solución
end