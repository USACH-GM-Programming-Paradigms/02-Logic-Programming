% Meta primaria: estudiante
% Meta primaria: estudiante/1
estudiante(amalia).
estudiante(kevin).
estudiante(agustin).

% Meta primaria: profesor
% profesor/1
profesor(barbara).
% profesor/2
profesor(gonzalo, paradigmas).

% producto_precio

% Predicado: 
% Meta Primaria: producto/2 
producto(switch, 300).
producto(computador, 200).
producto(zelda, 60).

% encontrarProductosMayoresAPrecio(Nombre, 100)
% Predicado: encontrarProductosMayoresAPrecio/2 -> encontrarProductosMayoresAPrecio(Nombre, PrecioReferencia)
% Meta Primaria: encontrarProductosMayoresAPrecio(Nombre, PrecioReferencia
% Meta Primaria: encontrarProductosMayoresAPrecio/2
% Meta Secundaria: producto/2 -> producto(nombre, precio)
% Dominio: Nombre, PrecioReferencia
encontrarProductosMayoresAPrecio(Nombre, PrecioReferencia) :-
    producto(Nombre, Precio),
    Precio > PrecioReferencia.
    
% encontrarProductosMayoresAPrecio(Nombre, Precio, 100). 
% Predicado: encontrarProductosMayoresAPrecio/3  
% Meta Primaria: encontrarProductosMayoresAPrecio/3
% Dominio: Nombre, Precio, PrecioReferencia
encontrarProductosMayoresAPrecio(Nombre, Precio, PrecioReferencia) :-
    producto(Nombre, Precio),
    Precio > PrecioReferencia.

% meta primaria: encontrarProductosMayoresAPrecio/4
%encontrarProductosMayoresAPrecio(Nombre, Precio, NombreTienda, PrecioReferencia).

% ; OR
% , AND
% . END

% Listas 

% Crear una clasula para verificar si un elemento pertenece a una lista

% pertenece(Elemento, Lista) -> true: cuando encuentra Elemento en Lista
%   false -> no lo puede responder

% pertenece(1, [1,2,3]) -> true
% shadow variable -> _   : no me importa

% Caso base: es lo que sabemos, es el caso minimo
% if -> condicion de parada/borde
pertenece(Elemento, [Elemento | _]).  % 3, [3, _] -> Elemento , [Elemento, _]

% else
pertenece(Elemento, [_ | Resto]) :-  %[3]
    pertenece(Elemento, Resto). %3, [3]

% member(Elemento, Lista). -> NO PUEDEN USARLO EN CONTROL/PEP, PERO LO PUEDEN USAR EN LAB

%agregar

%agregarAlPrincipio

%4, [1,2,3] -> [4,1,2,3]
%Elemento, Lista -> [Elemento | Lista]

% agregar(1, [4,5,6], ListaFinal).
agregar(Elemento, Lista, [Elemento | Lista]).

% agregarAlFinal(1, [], [1]).

agregarAlFinal(Elemento, [], [Elemento]).

agregarAlFinal(Elemento, [_|Resto], ListaFinal) :-
    agregarAlFinal(Elemento, Resto, ListaFinal).

% append([1,2,3], [4], L).
% append(Lista1, Lista2, ListaFinal).
    
% (2, [1,2,3])
% (2, [2,3]).

%   pertenece
% 1    [1,_]


% Tipos de datos en Prolog:
% 
% primitivo: symbol
% string  " "
% number
% Listas [ ] 

% |  %pipe 
% separa el primer elemento del RESTO DE LA LISTA

% car(lst) -> primer elemento -> symbol
% cdr (lst) -> resto -> []
% (car cdr cdr cdr) -> cadddr

% |

%def hello(message):
%	print ("hello", message)

% int main(args[]) { } 

% ; OR
% , AND
% . END



