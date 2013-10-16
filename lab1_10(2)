split([], [], [], []).

split([H|T], P, N, Z) :-
	H > 0,
	split(T, P1, N, Z),
	P = [H|P1].

split([H|T], P, N, Z) :-
	H < 0,
	split(T, P, N1, Z),
	N = [H|N1].

split([H|T], P, N, Z) :-
	H == 0,
	split(T, P, N, Z1),
	Z = [H|Z1].


