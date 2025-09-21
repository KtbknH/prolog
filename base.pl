/*
    Tester avec les buts chien(bobby), chien(jolly), chien(X), chat(tom), chat(X)
 */
chat(tom).
chat(jules).
chien(bobby).
lapin(bunny).
lapin(tintin).
lion(tara).

proprietaire(tom, marc).
proprietaire(jules,marc).
proprietaire(bobby,eric).
proprietaire(bunny,claire).
proprietaire(tintin,aude).
proprietaire(tara,cerza).
    
herbivore(H) :- lapin(H).

/*
    Tester avec les buts domestique(tom), domestique(lulu), domestique(X)
    NB : expression d'un ou
    => Etudier l'arbre de résolution du but domestique(D)
    => analyser les retours-arrière liés au OU du prédicat domestique
 */

domestique(X) :- chat(X).
domestique(X) :- chien(X).
domestique(X) :- lapin(X).

/* IDEM
*/

carnivore(X) :- chat(X).
carnivore(X) :- chien(X).
carnivore(X) :- lion(X).

/*
   La virgule en partie droite est un ET séquentiel.
*/
domestiqueCarnivore(X) :- domestique(X), carnivore(X).

/*
   Etudier l'arbre de résolution du but proprietaireLapin(Prop,Lapin)
   => analyser les retours-arrières liés à l'unification
 */
proprietaireLapin(P,L) :- proprietaire(L,P), lapin(L).

