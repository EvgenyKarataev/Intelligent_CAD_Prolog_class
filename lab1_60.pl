left(X, N, R) :-
	name(X, L),
	cut(L, N, R1),
	name(R, R1).

cut([L|_], 1, [L]) :-
	L \= [].

cut([], 0, []).

cut([], N, R) :-
	N > 0,
	N1 is N - 1,
	cut([], N1, R1),
	R = [32|R1].

cut([L|T], N, R) :-
	N > 1,
	N1 is N - 1,
	cut(T, N1, R1),
	R = [L|R1].






