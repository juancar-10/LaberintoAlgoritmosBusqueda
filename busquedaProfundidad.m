% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 26 de abril de 2025
% Descripción: Implementa DFS: explora en profundidad usando una pila LIFO.
%   Inserta sucesores uno a uno para retroceder y avanzar acorde al orden inverso.
%
% Llamado por: principal
% Llama a: hacerCola, inserta, vacia, primeroCola, borrarPrimero, expandir,
% testObjetivo, reconstruirRuta
% ---------------------------------------------------------------------

function ruta = busquedaProfundidad(L)
% Búsqueda en profundidad (DFS) usando pila LIFO
    inicio = [1,1];
    % Pila inicial
    pila = hacerCola();
    pila = inserta(pila, inicio);
    %Mapa de padres para la reconstrucción de la ruta
    padres = containers.Map;
    padres(sprintf('%d_%d', inicio)) = '';
    %Estructura de visitados
    visitado = false(size(L));
    visitado(1,1) = true;
    while ~vacia(pila)
        % Sacar el “tope” de la pila
        s = primeroCola(pila); pila = borrarPrimero(pila);
        % Si llegamos a la meta, construimos la ruta
        if testObjetivo(L, s)
            ruta = reconstruirRuta(padres, s);
            return;
        end
        % Generar sucesores
        suc = expandir(L, s);
        % Para DFS, insertar sucesores en orden inverso para explorar primero
        suc = flip(suc);
        % Insertar uno a uno en la pila
        for i = 1:numel(suc)
            v = suc{i}; keyV = sprintf('%d_%d', v);
            if ~visitado(v(1),v(2))
                padres(keyV) = sprintf('%d_%d', s);
                visitado(v(1),v(2)) = true;
                % insertar al frente para LIFO
                pila = [{v}; pila];
            end
        end
    end
    ruta = []; %Sin solución
end

