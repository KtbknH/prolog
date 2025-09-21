
%taille

taille([] , 0).
taille([_|Xs] , T) :- taille(Xs ,Ts) , T is Ts + 1 .

%minimum

minimum([] , _) :-false .
minimum([X] , X). 
minimum([X | Xs] , T) :- minimum(Xs ,Ts) , T is min(X, Ts).

%somme

somme([] , _) :- false.
somme([X] , X).
somme([X | Xs] , T) :- somme(Xs , Ts) , T is X + Ts.

%sommeproduit

prodscal([] , [_|_] , V) :- false.
prodscal([_] , [] , V) :- false.
prodscal([] , [],  0).
prodscal([X] , [Xs] , V) :- V is X * Xs .
prodscal([X|Xs] , [S|Fx] , V) :- prodscal(Xs,Fx , Vs) , V is X * S + Vs .

%ajoutTete

ajoutTete(X , Xs, [X|Xs]).

%ajouQueue

ajouQueue(X, [], [X]).
ajouQueue(X , [Y|Xs] , [Y|L]) :- ajouQueue(X,Xs,L).

%concat

concat([] , X , X).
%concat(X ,[] , X).
%concat([X|Xs] , [Vs|V] , T) :- ajouQueue(V , [X|Xs] , Ts) , concat(Ts , V , T).
concat([E|RL1] , L2 , [E|RLres]) :- concat(RL1,L2,RLres).

%membre

membre(X , []):-false.
membre(X , [X|T]).
membre(X,[Xs|T]) :- membre(X,T).

%selection

selection([X|Xs], X ,Xs).
selection([X|Xs] , E2 , [X|R2]) :- not(E2 == X), selection(Xs,E2, R2).
