% Prolog

% Prolog se basa en la resolución de cláusulas.
% Las cláusulas pueden ser Hechos o Reglas.

person(aristoteles).
person(socrates).
person(platon).

% mortal/1
% 	Retorna True si es person
%	Para todo X, X es mortal si X es una persona
%	mortal(X): la pregunta es: Quién es mortal?
mortal(X) :- person(X).

%The Prolog program is composed of predicates (procedures, record types, relations). Each is defined by its name and a number called arity. The arity is the fixed number of arguments (attributes, fields) the predicate has. Two predicates with the same name and different arity are considered to be different predicates.


% Aplicación de negocio

% customer/3
customer("Gonzalo", santiago, buen_credito).
customer("Pedro", buenosaires, mal_credito).

% mortal_report/0
mortal_report :-
	write('Known mortals are:'),nl,
    mortal(X),
	write(X), nl,
	fail.

% ?- mortal_report

% Aplicación: Habitación

room(cocina).
room(oficina).
room(salon).
room("Living room").
room(patio).

door(oficina, salon).
door(cocina, oficina).
door(salon, "Living room").
door(cocina, patio).
door("Living room", cocina).

location(escritorio, oficina).
location(manzana, cocina).
location(manzana, "Living room").
location(linterna, escritorio).
location("maquina de lavar", patio).
location("ropa sucia", "maquina de lavar").
location(broccoli, cocina).
location(galletas_cracker, cocina).
location(computador, oficina).

comestible(broccoli).
comestible(manzana).
comestible(galletas_cracker).

buen_sabor(manzana).
buen_sabor(galletas_cracker).
mal_sabor(broccoli).

% Consultas (Queries)

% I: item
% H: habitación
% ?- door(cocina, H), location(I,H).

% Regla
% Anteriormente mencionamos que un predicado se define por clausulas.
% Por otro lado, las clausulas pueden ser Hechos o Reglas.
% Una regla es sólo una consulta almacenada.

% min(2, 5, Min).
min(X, Y, Min) :- X =< Y, Min = X; Min = Y.

% where_food/2
where_food(X,Y) :- 
	location(X, Y),
	comestible(X).

where_food(X,Y) :- 
	location(X, Y),
	buen_sabor(X).

% where_food(X, cocina).

%Room X is connected to a room Y if there is a door from X to Y, or if there is a door from Y to x
connect(X, Y) :- door(X, Y).
connect(X, Y) :- door(Y, X).

% Aplicación: Mascotas
size(small).
size(medium).
noise(woof).
noise(meow).
noise(squeak).

pet(dog):- size(medium), noise(woof).
pet(cat):- size(medium), noise(meow).
pet(mouse):- size(small), noise(squeak).

% Recursión:



%A thing, T1, is contained in another thing, T2, if T1 is directly lo- cated in T2. (This is the boundary condition.)
%A thing, T1, is contained in another thing ,T2, if some intermedi- ate thing, X, is located in T2 and T1 is contained in X. (This is where we simplify and recurse.)
% where we simplify and recurse)

location("regalo", escritorio).
location("super8", "regalo").
location("bombones", "regalo").

% is_contained_in/2
%	Primary Goal: T1 T2
%	Secundary Goal: X

is_contained_in(T1, T2) :- 
    location(T1, T2).

is_contained_in(T1, T2) :-
    location(X, T2),
    is_contained_in(T1, X).

% is_contained_in(X, oficina).
% is_contained_in("regalo", oficina).
% is_contained_in(manzana, oficina).

% Data Structures

% object/4
% nombre_objeto, color, tamaño, peso
object(vela, roja, small, 1).
object(manzana, roja, small, 1).
object(manzana, verde, small, 1).
object(mesa, azul, big, 50).

location_s(object(candle,red,small,1 ),kitchen).
location_s(object(apple,red,smalJ,1 ),kitchen).
location_s(object(apple,green,small,1),kitchen).
location_s(object(table,blue,big, 50) ,kitchen).

%location_s(X, cocina).

% Unificación
% location_s(object(X,red, S, W) ,kitchen).
% location_s(object(X, red ,_,_) ,kitchen).

% Listas

% connect(cocina, oficina).

% Predicados

% Clausulas

% Backtracking

% Unificación