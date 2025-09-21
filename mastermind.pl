%Couleur
couleur(rouge).
couleur(blanc).
couleur(bleu).
couleur(gris).
couleur(vert).
%prédicat contient_couleurs(L)
contient_couleurs([]).
contient_couleurs([X|XL]):- couleur(X) , contient_couleurs(XL).
%Ecrire le prédicat prop_valide(L) qui doit renvoyer vrai si la propossition représentée 
%par la liste L est bien une proposition valide ie une liste de 5 couleurs.
prop_valide(L):- length(L, 5) , contient_couleur(L).
%le prédicat bien_places(Lprop,Lsol,LpropPB,LsolPB)
bien_places([], [],[],[]). 
bien_places([Lprop|Tprop], [Lsol|Tsol], [Lprop|LpropPB], [Lsol|LsolPB]) :- Lprop == Lsol,bien_places(Tprop, Tsol, LpropPB, LsolPB).
bien_places([Lprop|Tprop], [Lsol|Tsol], [Lprop|LpropPB], [Lsol|LsolPB]) :- Lprop \== Lsol,bien_places(Tprop, Tsol, LpropPB, LsolPB) ,! .
% le prédicat mal_places(LpropPB,LsolPB,N)
mal_places([],[],0).
mal_places([X|Xs],[V|Vs],N):- select(X, [V|Vs], Res) , mal_places(Xs,Res,H) , N is H + 1.
mal_places([X|Xs],[V|Vs],N):- not(member(X, [V|Vs])) , mal_places(Xs,[V|Vs], N).



