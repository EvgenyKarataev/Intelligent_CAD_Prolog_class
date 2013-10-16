deleteVowels(L, [], L).

deleteVowels(L, [H|T], R) :-
	name(H, [AH|_]),
	delete(L, AH, R1),
	deleteVowels(R1, T, R).

deleteLetter(_, [_|[]], []).

deleteLetter(A, [HL|TL], R) :-
	A = HL,
	deleteLetter(A, TL, R).

deleteLetter(A, [HL|TL], [HL|TL]) :-
	A \= HL.

deleteDoubles([H|[]], [H]).

deleteDoubles([],[]).

deleteDoubles([H|T], R) :-
	deleteLetter(H, T, R1),
	deleteDoubles(R1, R2),
	      R = [H|R2].

leaveOnly([HL|[]], _, [HL]).

leaveOnly([HL|_], 1, [HL]).

leaveOnly([HL|TL], N, R) :-
	N > 1,
	N1 is N - 1,
	leaveOnly(TL, N1, R1),
	R = [HL|R1].

compress(A, R) :-
	name(A, [H|T]),
	Vowels = [a, e, i, o, u, h, w, y],
	deleteVowels(T, Vowels, R1),
	deleteDoubles([H|R1], R2),
	leaveOnly(R2, 4, R3),
	name(R, R3).

