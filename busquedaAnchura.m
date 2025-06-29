% ---------------------------------------------------------------------
% Práctica: 1 Búsqueda en árboles
% Autor: Juan Carlos García Ventura
% Fecha: 25 de abril de 2025
% Descripción: Implementa BFS: explora por niveles usando una cola FIFO y 
%   reconstruye la ruta óptima al encontrar la meta
%
% Llamado por: principal
% Llama a: hacerCola, inserta, insertarTodo, vacia, primeroCola, 
%   borrarPrimero, expandir, testObjetivo, reconstruirRuta
% ---------------------------------------------------------------------

function ruta = busquedaAnchura(L)
    % Búsqueda en anchura (BFS) usando cola FIFO
    inicio = [1,1];
    %Verificamos si ya estamos en la meta
    if testObjetivo(L, inicio)
        ruta = inicio; return;
    end
    %Inicializamos la frontera con el nodo inicial
    cola = hacerCola();
    cola = inserta(cola, inicio);
    %Mapa de padres para la reconstrucción de la ruta
    padres = containers.Map;
    padres(sprintf('%d_%d', inicio)) = '';
    %Estructura de visitados
    visitado = false(size(L));
    visitado(1,1) = true;

    while ~vacia(cola)
        %Extraer el primer nodo de la cola
        s = primeroCola(cola); 
        cola = borrarPrimero(cola);
        %Expandir sucesores
        suc = expandir(L, s);
        nuevos = {};
        for i = 1:numel(suc)
            v = suc{i}; keyV = sprintf('%d_%d', v);
            if ~visitado(v(1), v(2))
                %Marcar padre y visitado
                padres(keyV) = sprintf('%d_%d', s);
                visitado(v(1), v(2)) = true;
                %Si es meta, reconstruir el camino y salir
                if testObjetivo(L, v)
                    ruta = reconstruirRuta(padres, v);
                    return;
                end
                %Acumular sucesores para añadir a la vez
                nuevos{end+1} = v;
            end
        end
        %Insertar todos los nuevos sucesores al final de la cola
        cola = insertarTodo(cola, nuevos);
    end
    % Si se vacía la cola sin hallar meta, no hay solución
    ruta = [];
end