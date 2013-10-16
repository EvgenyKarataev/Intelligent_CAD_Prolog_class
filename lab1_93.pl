fastSort(L, S) :-
	append(L1, [X, Y|T], L),
	X > Y,
	append(L1, [Y, X|T], R),
	fastSort(R, S).
fastSort(L, L).
