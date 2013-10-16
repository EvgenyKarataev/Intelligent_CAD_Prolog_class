p(X, Y) :-
	reverse(X, L),
	sumList(L, 1, Y).

sumList([H|[]], _, H).

sumList([H|T], Z, Y) :-
	T \= [],
	Z1 is Z * (-1),
	sumList(T, Z1, Y1),
	Y is Y1 + Z * H.
