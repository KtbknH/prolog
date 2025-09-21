/*
    predicat
*/
male(pierre).
male(jules).
male(paul).
male(leo).
male(marc).
male(albert).
male(arthur).
male(leopold).
male(franck).

femelle(marie).
femelle(chloee).
femelle(cathy).
femelle(lea).
femelle(sophie).
femelle(julie).

/* enfant */

enfant(jules , pierre).
enfant(jules , marie).
enfant(paul , marie).
enfant(lea , marie).
enfant(paul , pierre).
enfant(lea , pierre).
enfant(marc , jules).
enfant(sophie , jules).
enfant(julie , jules).
enfant(sophie , chloee).
enfant(marc , chloee).
enfant(julie , chloee).
enfant(albert , paul).
enfant(albert , cathy).
enfant(leopold , lea).
enfant(arthur, lea).
enfant(leopold , leo).
enfant(arthur , leo).
enfant(franck , marc).

/* mari */

mari(pierre,marie).
mari(jules,chloee).
mari(paul,cathy).
mari(leo,lea).

/*femme*/

femme(X,Y) :- mari(Y , X).

/* garçon */

garcon(X,Y) :- enfant(X,Y) , male(X).

/* fille */

fille(X,Y) :- enfant(X,Y) , femelle(X).

/* epoux */

epoux(X,Y) :- mari(X,Y).
epouse(X,Y) :- femme(X,Y).

/* père et mère */

pere(X,Y) :- enfant(Y,X) , male(X).
mere(X,Y) :- enfant(Y,X) , femelle(X).

/* sibilin */

sibilin(X,Y) :- pere(H , X) , pere(H , Y) , mere(F , X) , mere(F , Y) ,X \= Y.

/* brobro et sista */

bro(X,Y) :- sibilin(X , Y) , male(X).
sis(X,Y) :- sibilin(X,Y) , femelle(X).

/* grandparent */

grandparent(X,Y) :- enfant(Y,P) , enfant(P , X).
grandpere(X,Y) :- grandparent(X,Y) , male(X).
grandmere(X,Y) :- grandparent(X,Y) , femelle(X).

/* Oncle  et tante*/

oncle(X,Y) :- enfant(Y , H) , bro(X , H).
tante(X,Y) :- enfant(Y,H) , sis(X,H).

/* Cousin */

cousin(X,Y) :- enfant(Y , P) , oncle(P , X) , male(X).
cousin(X,Y) :- enfant(Y , P) , tante(P , X) , male(X).
cousine(X,Y) :- enfant(Y , P) , oncle(P , X) , femelle(X).
cousine(X,Y) :- enfant(Y , P) , tante(P , X) , femelle(X).

/* aieul */

aieul(X,Y) :- pere(X , Y).
aieul(X,Y) :- mere(X , Y).
aieul(X,Y) :- oncle(X , Y).
aieul(X,Y) :- tante(X , Y).
aieul(X,Y) :- enfant(Y,P) , aieul(X,P).

/* famille */

famille(X,Y) :- aieul(X,Y).
famille(X,Y) :- aieul(Y,X).
famille(X,Y) :- cousin(X,Y).
famille(X,Y) :- cousine(X,Y).
famille(X,Y) :- sibilin(X,Y).