% Contar elementos

%contar([], 0).
%contar(ListaIn, N).
%contar([1,2,3], N).
contar([],0).
contar([_|Resto], N) :- 
    contar(Resto, Acc),
    N is Acc + 1.

% contarSoloNumeros([1,2,3, "a"], N).
contarSoloNumeros([],0).
contarSoloNumeros([Elemento|Resto], N) :- 
    contarSoloNumeros(Resto, Acc),
    (  number(Elemento)  %if
    -> N is Acc + 1      %then, tambien se puede usar N = Acc + 1
    ;  N is Acc          %else, tambien se puede usar N = Acc + 1
    ).

% Insertar elemento
insertarAlPrincipio( Elemento, [], [Elemento] ).
insertarAlPrincipio( Elemento, Lista, [Elemento|Lista] ).

% Map 
% map([1,2,3], plus(1), X).
map([], F, []).
map([H|T], F, [HO|TO]) :- 
    call(F, H, HO),
    map(T,F,TO).

pixbitd(X, Y, Bit, Depth, [X, Y, Bit, Depth]).
pixrgbd(X, Y, R, G, B, Depth, [X, Y, R, G, B, Depth]).
hexmap(X, Y, Hex, Depth, [X, Y, Hex, Depth]).

image(Largo, Ancho, Pixeles, [Largo, Ancho, Pixeles]).

%pixbitd( 0, 0, 1, 10, PA),
%pixbitd( 0, 1, 0, 20, PB), 
%pixbitd( 1, 0, 0, 30, PC), 
%pixbitd( 1, 1, 1, 4, PD), 
%image( 2, 2, [PA, PB, PC, PD], I),
%imageTobitmap?(I).
%
% I = [2, 2, [[0, 0, 1, 10], [0, 1, 0, 20], [1, 0, 0, 30], [1, 1, 1, 4]]]
%image(Largo, Ancho, Pixeles, [2, 2, [[0, 0, 1, 10], [0, 1, 0, 20], [1, 0, 0, 30], [1, 1, 1, 4]]]).
%Pixeles = [[0, 0, 1, 10], [0, 1, 0, 20], [1, 0, 0, 30], [1, 1, 1, 4]]]
% [Pixel|Rest] = [[0, 0, 1, 10], [0, 1, 0, 20], [1, 0, 0, 30], [1, 1, 1, 4]].
%nth0(1, [[0, 0, 1, 10], [0, 1, 0, 20], [1, 0, 0, 30], [1, 1, 1, 4]], Pixel).
%nth0(1, [0, 0, 1, 10], PixelValue),
%is_boolean(PixelValue).

%( condition -> then_clause ; else_clause )


pixelsAreHexmap?([]).
pixelsAreHexmap?([Hexmap | Rest]) :-
    hexmap(_, _, Hex, _, Hexmap),
    string(Hex),
    pixelsAreHexmap(Rest).

pixelsAreBitmap?([]).
pixelsAreBitmap?([Pixbitd | Rest]) :-
    pixbitd(_, _, Bit, _, Pixbitd),
    (Bit == 0 ; Bit == 1),
    pixelsAreBitmap?(Rest).

imageTobitmap?(Image) :-
    image(_, _, Pixels, Image),
    pixelsAreBitmap?(Pixels).


%solo pixbit
% ancho es Y
movePixelH(Ancho, Pixel, PixelOut) :-
    pixbitd(X, Y, Bit, Depth, Pixel),
    (  Y < Ancho
    -> NewY is Y + 1     
    ;  NewY is 0
    ),
    pixbitd(X, NewY, Bit, Depth, PixelOut).

movePixelsHorizontally(Ancho, [Pixel|Resto], PixelsAcc, PixelsOut) :-
    movePixelH(Ancho, Pixel, PixelOut),
    insertarAlPrincipio(PixelOut, PixelsAcc, PixelsOut),
    
    

moveH(ImageIn, ImageOut) :-
    image(Largo, Ancho, PixelsIn, ImageIn),
    movePixelsHorizontally(Ancho, PixelsIn, PixelsOut),
	image(Largo, Ancho, PixelsOut, ImageOut).


