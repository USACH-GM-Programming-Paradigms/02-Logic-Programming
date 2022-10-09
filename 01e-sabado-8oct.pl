
% Parte 1

% todos son simbolos (symbol)
% number: 1,2, 3.5
% strings: "hola", "chao"
% listas: [] 
% boolean: True or False
% simbolo

% Si un simbolo empieza con mayuscula, eso es una Variable.

% Hechos
% Es verdadero que "ps5" es un producto
producto("ps5").
producto("super nintendo").

% Es verdadero que gonzalo es profe de paradigmas
% paradigmas(Profesor).

%Es verdadero que gonzalo es paradigmas_profesor
paradigmas_profesor(gonzalo).

%paradigmas_profesor(gonzalo).

% paradigmas_profesor/1
paradigmas_profesor(samuel).

% paradigmas_profesor(nombre, numero_semestres).

% paradigmas_profesor/2
paradigmas_profesor(gonzalo, 6).
paradigmas_profesor(roberto, 600).
paradigmas_profesor(samuel, 1).
paradigmas_profesor(alex, 1).

% query:
% encontrar todos los profes que han hecho paradigmas
% por 1 semestre

% profesores que hayan impartido el ramo mas de N vez

% TODO:
% mayorASemestres(6, Profesor)
% ? - roberto
% mayorASemestres(6, Profesor)
% ? - roberto

% getProfesoresWithSemestresMayorA/2
% Meta principal: la pregunta que estoy resolviendo
% 	getProfesoresWithSemestresMayorA
% Meta secundaria:
%	paradigmas_profesor
% Dom: NumeroSemestres: number
%	   Profesor: symbol
% Rec: Profesor: symbol
getProfesoresWithSemestresMayorA(NumeroSemestres, Profesor) :-
    %paradigmas_profesor(profesor, numero_semestres),
    paradigmas_profesor(Profesor, SemestresActual),
    NumeroSemestres > SemestresActual.


                            
persona(gonzalo).

% number
% symbol
% strings
% listas

% hola soy un comentario 


% Parte 2

% Prolog como base de datos

% Hechos

% TDA Estudiante: 
%  Id, Nombre, Rut, Carrera

estudiante(1, gmartinez, "111111-1", "Ing Civil Informatica").
estudiante(2, fernando, "121212-2", "Ing Civil Mecanica").
estudiante(3, carla, "131313-3", "Diseño Grafico").

% TDA Nota Estudiante: 
%  Id Estudiante, Nota, Asignatura

nota_estudiante(1, 7, "Paradigmas de Programacion").
nota_estudiante(1, 2, "Comunicacion").
nota_estudiante(1, 4.2, "Ingles 1").
nota_estudiante(2, 5.7, "Paradigmas de Programacion").
nota_estudiante(2, 3.1, "Machine Learning").
nota_estudiante(2, 1.1, "Data Science").

% Reglas
findNotaByNombreEstudiante(Nombre, Nota) :-
    estudiante(Id, Nombre, _, _),
    nota_estudiante(Id, Nota, _).


% Consultas:
% findNotaByNombreEstudiante(gmartinez, Nota).
% findNotaByNombreEstudiante(gmartinez, 7).
% findNotaByNombreEstudiante(gmartinez, 1).


% Parte 3

%En un sistema un estudiante se define con su Id, Nombre, Rut, Carrera. 

%Luego, cada estudiante tiene una nota asociada a una asignatura.

%A partir de este contexto, resuelva las siguientes interrogantes:

%Diseñe los hechos que modelan el problema recién descrito.
%Diseñe e implemente las siguientes reglas.
%   Encontrar la carrera del estudiante a partir de su nombre
%   Encontrar todas las notas de un estudiante a partir de su nombre.

%%% 

%%% 1. Diseñar

%% TDA estudiante

%estudiante(Id, Nombre, Rut, Carrera)
%estudiante(1, gonzalo, "18x", "ing civil informatica").

%Listas - Constructor
estudiante(Id, Nombre, Rut, Carrera, [Id, Nombre, Rut, Carrera]).

%. lista_estudiantes: LstOut
lista_estudiantes(E1, E2, E3, [E1, E2, E3]).
                      
% nota, asignatura

%estudiante_nota(Id_estudiante, nota, asignatura).
estudiante_nota(1, 7, "paradigmas").
estudiante_nota(1, 1, "expresion artistica").

% findCarreraByNombre(gonzalo, Carrera).
findCarreraByNombre(NombreInput, CarreraOutput) :-
	estudiante(_, NombreInput, _, CarreraOutput).

% findNotasByNombre(gonzalo, Nota).
findNotasByNombre(NombreInput, NotaOutput) :-
	estudiante(Id, NombreInput, _, _),
    estudiante_nota(Id, NotaOutput, _).

%estudiante(1, gonzalo, "18x", "ing civil informatica", E1), 
%estudiante(2, alex, "18x", "ing civil informatica", E2), 
%estudiante(3, fernando, "10x", "ing civil informatica2", E3),
%lista_estudiantes(E1,E2,E3, Estudiantes).


%%% Laboratorio

% pixbit, pixrgbd, hexmap

% pixbit(1,1,1,1, P1).
pixbit(X, Y, Bit, Depth, [X, Y, Bit, Depth]).

% pixrgbd(1,1,100,200,255,1, P2).
pixrgbd(X, Y, R, G, B, Depth, [X, Y, R, G, B, Depth]).

% hexmap(1,1,"#fffff",200, P3).
hexmap(X, Y, Hex, Depth, [X, Y, Hex, Depth]).

% Imagen
image(Largo, Ancho, Pixeles, [Largo, Ancho, Pixeles]).

%pixbit(2,3,0,10,P1),
%pixbit(3,4,1,20,P2),
%pixbit(1,2,0,5,P3),
%pixbit(4,5,1,15,P5),
%image(4,5,[P1,P2,P3], I1).