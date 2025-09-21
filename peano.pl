/* Le peano */

peano(zero).

peano(X) :- X = s(Y) , peano(Y).

/* plus */

plus(X , zero , X).
plus(X , s(Y) , s(Z)) :- plus(X, Y , Z). 