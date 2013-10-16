p(L, 0, L).

p(L, 1, R) :-
	reverse(L, [HL1|TL1]),
	reverse(TL1, L2),
	R = [HL1|L2].

p([H|T], -1, R) :-
	reverse(T, T1),
	R1 = [H|T1],
	reverse(R1, R).

p(L, N, R) :-
	N > 1, !,
	N1 is N - 1,
	p(L, 1, R1),
	p(R1, N1, R).

p(L, N, R) :-
	N < -1, !,
	N1 is N + 1,
	p(L, -1, R1),
	p(R1, N1, R).











