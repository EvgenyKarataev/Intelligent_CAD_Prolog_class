predok(genry, jek).
predok(jek, richard).
predok(richard, charlz).
predok(charlz, jein).

predokWithTree(Y, X, T) :-
	predok(Z, X),
	Z \= Y,
	predokWithTree(Y, Z, T1),
	reverse(T1, T2),
	reverse([Z|T2], T).

predokWithTree(Y, X, []) :-
	predok(Z, X),
	Z = Y.
