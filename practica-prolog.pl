

% comprueba([1,b,3],[a,b,c]).
% FALSE
% comprueba([b,c,a],[1,2,a]).
% FALSE
% comprueba([a,b,2],[c,d,e,5]).
% TRUE

not_equal(X,Y):-
    not(X = Y).

equal(X,Y):-
    X=Y.

comprueba(_,[]).
comprueba([],_).
comprueba([Cabeza_l1|Cola_L1],[Cabeza_l2|Cola_L2]):-
    not_equal(Cabeza_l1,Cabeza_l2),
    comprueba(Cola_L1,Cola_L2).




% borrar(1, [1, 2, 1, 3, 1], Y).
% Y = [2, 1, 3, 1]
borrar(Numero,Lista_busqueda, Resultado) :-
    select(Numero,Lista_busqueda,Resultado).


% eliminar_todos(1,[1,2,1,3,1,5,1,6,7,8,5,5,1],Sol).
% Sol = [2, 3, 5, 6, 7, 8, 5, 5] .
eliminar_todos(_,[],[]).
eliminar_todos(Numero,[H|T],Resultado):-
    %esMiembro(H,T),
    equal(Numero,H),
    !,
    eliminar_todos(Numero,T,Resultado).

eliminar_todos(Numero,[H|T],[H|S]):-
    eliminar_todos(Numero,T,S).

%para saber si es mienbro de una lista
esMiembro(X,[X|_]).
esMiembro(X,[_|T]):-esMiembro(X,T).

%para buscar un elemento de una lista
%buscar([6,2,3,4,0],1,Buscado).
buscar(_,0,_).
buscar([H|_],1,H).
buscar([_|T],N,Buscado):-
    N1 is N-1,
    buscar(T,N1,Buscado).
