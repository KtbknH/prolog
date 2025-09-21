:- dynamic arbre/3.
%Arbre
racine("Pattes?").
arbre("Pattes?","Grandes Oreilles?",animal(vipère)).
arbre("Grandes Oreilles?", "Trompe?",animal(chien)).
arbre("Trompe?",animal(elephant),animal(ane)).
% Question et reponse
poseQuestion(Question , Reponse):- writeln(Question) , read(Reponse) , !.
%propose un animal
proposeAnimal(Animal):- writeln(Animal) , read(Reponse) , traitementReponse(Reponse , Animal).

traitementReponse(oui, _) :- writeln('J''ai gagné').
traitementReponse(non , X) :- writeln('J''ai perdu') ,writeln("Quel est cette animal"), 
    read(Solution), writeln("Quelle question poser"), read(Condition),
    modifierArbre(X , Solution, Condition).
modifierArbre(Animal, Solution, Condition):- retract(arbre(Racine , FilsG,animal(Animal))) , 
    asserta((arbre(Racine , FilsG , Condition))) , asserta((arbre(Condition , animal(Solution) , animal(Animal)))).
modifierArbre(Animal, Solution, Condition):- retract(arbre(Racine ,animal(Animal), FilsD)) ,
    asserta((arbre(Racine , Condition , FilsD))) , asserta((arbre(Condition , animal(Animal) , animal(Solution)))).  

% Le jeu

jeu :- racine(R) , etapeJeu(R).

etapeJeu(Question):- poseQuestion(Question , Reponse) , traiterReponse(Question , Reponse).
traiterReponse(Question , oui):- arbre(Question,FilsG,_) , traiterFils(FilsG).
traiterReponse(Question , non) :- arbre(Question, _ , FilsD) , traiterFils(FilsD).
traiterFils(animal(A)) :- proposeAnimal(A).
traiterFils(ProchaineQuestion):-etapeJeu(ProchaineQuestion).





