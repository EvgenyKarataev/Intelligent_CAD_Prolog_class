findPerfect(0, []).

findPerfect(X, L) :-
	X > 0,
	X1 is X - 1,
	findPerfect(X1, L1),
	X2 is X + 1,
	findDeliteli(X, X2, D),
	sumList(D, R),
	((R =:= 2 * X, L = [X|L1], !);
	(L = L1),!).

sumList([], 0).

sumList([H|T], R) :-
	sumList(T, R1),
	R is H + R1.

findDeliteli(_, 1, []).

findDeliteli(X, S, D) :-
	!,
	S > 1, S1 is S - 1,
	findDeliteli(X, S1, D1),
	((X mod S1 =:= 0, D = [S1|D1], !);
	(D = D1, !)).
