% Prolog

% Prolog se basa en la resolución de cláusulas.
% Las cláusulas pueden ser Hechos o Reglas.

% Predicados: entregan true o false.

% Hechos: son siempre true

person(aristoteles).
person(socrates).
person(platon).

% Reglas: resuelven una pregunta

% mortal/1
% 	Entrega True si es person
%	Para todo X, X es mortal si X es una persona
% Meta principal: mortal
% Meta secundaria: persona
% Query: mortal(X).
mortal(X) :- person(X).

estudiante(gonzalo, 5).
estudiante(pablo, 2).
estudiante(margarita, 3).
estudiante(patricia, 6).

%estudiantes_aprobaron(N).
estudiantes_aprobaron(Nombre) :-
    estudiante(Nombre, Valor),
    Valor >= 4.

% Listas

% Lista = [1,2,3,4].

% A través de unificacion puedo consolidar un TDA

% producto(teclado, 100, 3, P1).
producto(Nombre, Precio, Cantidad, [Nombre, Precio, Cantidad]).

% producto(teclado, 100, 3, P1),
%producto(mouse, 100, 3, P2),
%producto(mousepad, 100, 3, P3),
%producto(teclado_mecanico, 100, 3, P4),
%lista_productos_categoria("accesorios", [P1,P2,P3,P4], ProductosPorCategoria).
lista_productos_categoria(Categoria, Productos, [Categoria, Productos]).