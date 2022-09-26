
profesor(gonzalo, 29).
profesor(gonzalo, 29, 1.70).
profesor(roberto, 41, 1.70).
profesor(roberto).
profesor(victor).
profesor(miguel).
profesorAsignatura(gonzalo, paradigmas).
profesorAsignatura(roberto, paradigmas).
profesorAsignatura(victor, paradigmas).

% nombre, asignatura, total alumnos
profesorAsignatura(gonzalo, paradigmas, 10).
profesorAsignatura(victor, paradigmas, 20).
profesorAsignatura(monica, algoritmos, 30).
profesorAsignatura(rannou, sistemas, 40).

% holi 
alumno(carlos).
alumno(argenis).

alumno(carlos, 1.70).

%profesor(X, Edad, Estatura), 
%NuevaEdad is Edad + 1,
%NuevaEstatura is Estatura - 9,
%NuevaEdad2 is Edad + 10,
%NuevaEstatura2 is NuevaEstatura+10.


% Obtener la cantidad de alumnos inscritos mayor a N

% Meta Principal: Profesor
% Meta Secundaria: Inscritos
getProfesorConMayorAlumnosInscritos(N, Profesor, Asignatura) :-
    profesorAsignatura(Profesor, Asignatura, Inscritos),
    Inscritos > N.


% Listas


% TDA

% TDA Fecha

% Representación: 
% dia - mes - año
% mes - dia - año
% dd/mm/yyyy

%fecha(dia, mes, año).
%fecha(21,11,2022).



% TDA estudiante

% nombre, apellido, promedio notas
%estudiante(nombre,apellido,promedio).
estudiante("gonzalo", "martinez", 6.9).


fecha(Dia, Mes, Anio, [Dia, Mes, Anio]).

% Crear una nueva fecha a partir de FechaIn usando
% NuevoDia
crearNuevaFecha(FechaIn, NuevoDia, FechaOut) :-
    fecha(_, Mes, Anio, FechaIn),
    fecha(Dia, _, _, FechaOut).