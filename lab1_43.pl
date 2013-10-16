sortUp([], []).

sortUp([HLin|TLin], Lout) :-
	sortUp(TLin, Lout1),
	insert(HLin, Lout1, Lout).

insert(X, [], R) :-
	R = [X].

insert(X, [H|T], R) :-
	X >= H,
	insert(X, T, R1),
	R = [H|R1].

insert(X, [H|L], R) :-
	X < H,
	R = [X|[H|L]].

