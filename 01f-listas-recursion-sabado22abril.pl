% Listas y Recursión

% countdown(5).
countdown(0) :-
    write('Boom!!').
countdown(N) :-
    N > 0,
    write(N), nl,
    N1 is N - 1,
    countdown(N1).

% factorial
% factorial(4, Output).
factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, SubResult),
    Result is N * SubResult.

% Implementación de member
member(X, [X | _]).
member(X, [_ | Tail]) :-
    member(X, Tail).

% list_length([1,2,3], L).
list_length([], 0).
list_length([_ | Tail], Length) :-
    list_length(Tail, TailLength),
    Length is TailLength + 1.

% agregar al principio
% add_to_beginning(9, [1,2,3], L).
add_to_beginning(Element, List, [Element | List]).

% agregar al final
% add_to_end(9, [1,2,3], L).
add_to_end(Element, [], [Element]).
add_to_end(Element, [Head | Tail], [Head | NewTail]) :-
    add_to_end(Element, Tail, NewTail).

% borrar un elemento de la lista
deleteOnlyAtFirst(_, [], []).
deleteOnlyAtFirst(E, [E | Rest], Rest).

% borrar en cualquier posicion
delete(_, [], []) :- !.
delete(Element, [Element | Tail], NewTail) :-
    delete(Element, Tail, NewTail), !.
delete(Element, [Head | Tail], [Head | NewTail]) :-
    delete(Element, Tail, NewTail).
