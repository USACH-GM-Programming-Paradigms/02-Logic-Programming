% Prolog
% Es el mejor chef que existe
% Le pasan una comida y el automaticamente sabe la receta
% Le pueden pasar una receta y el sabe los ingredientes

% Backtracking: Buscar todas las posibles respuestas
%   -> Devolvernos a la pregunta
% Todas sus respuestas son OR's

% Noción del mundo cerrado

%estudiante("Gonzalo") :- true.

% estudiante/1: predicado
% Dominio: Nombre (str)
estudiante("Gonzalo").
estudiante("Emilio").
estudiante("Barbara").


% estudiante/2: predicado
% estudiante(nombre, NotaPEP1).
% Dominio: Nombre (str), NotaPep1 (number)
estudiante("Alvaro", 7).

% Listas:
% TDA
% estudiante/3
% Unificación: construir valores a partir de otros valores

% constructores
estudiante(Nombre, NotaPep1, [Nombre, NotaPep1]).

% TDA File
file(Nombre, Extension, Contenido, Permisos, [Nombre, Extension, Contenido, Permisos]).

% TDA filesystem
filesystem(Nombre, Archivos, Usuarios, [Nombre, Archivos, Usuarios]).

% TDA User
user(Username, [Username]).


% Inferencia: a traves de una variable/valor puede descubrir otras variables/valores


% Capa Selectora
getContentFromFile(FileIn, Content) :-
   file(_, _, Content, _, FileIn).

% Capa modificadora
setContentFromFile(FileIn, NewContent, UpdatedFile) :-
   file(Nombre, Extension, _, Permisos, FileIn),
   file(Nombre, Extension, NewContent, Permisos, UpdatedFile).

%file("paradigmas", "txt", "hola mundo", "H", Archivo1),
%file("ecuaciones diferenciales", "docx", "hola mundo 3", "H", Archivo2),
%user("Gonzalo", User1),
%filesystem("MiFs1", [Archivo1, Archivo2], User1, FileSystem1).

%file("paradigmas", "txt", "hola mundo", "H", Archivo1),
%getContentFromFile(Archivo1, ContenidoArchivo1),
%setContentFromFile(Archivo1, "chao mundo", Archivo2),
%getContentFromFile(Archivo2, ContenidoArchivo2).


%                         estudiante(X)
%.   |                      |                     |
%   estudiante(Gonzalo).    estudiante(emilio)   estudiante(barbara). 


% Recursion
% Ustedes le enseñan a prolog como hacer una recursion

% L = [1,2,3,4].
% Si un numero X pertenece a la lista L

% pertenece(Numero, Lista).
% pertenece(1, [1,2,3]).
% true
% true: TE PUEDO DAR UNA RESPUESTA -> 1 pertenece a Lista
% pertenece(4, [1,2,3]).
% false -> NO PUEDO ENTREGAR UNA RESPUESTA
% 
% false.
% 1, [1,2,3].
% pertenece(E, Lista)
% pertenece(1, [1,2,3]).
% operador corte: !
pertenece(Elemento, [Elemento | _]) :- !. % caso base

pertenece(Elemento, [_ | Resto]) :-
   pertenece(Elemento, Resto).   % recursión

