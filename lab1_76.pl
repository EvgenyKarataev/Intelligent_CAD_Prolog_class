p(1, L) :-
	L = [[0], [1]].

p(2, L) :-
	L = [[0, 0], [0, 1], [1, 0], [1, 1]].

p(N, L) :-
	N > 1,
	N1 is N - 1,
	p(N1, L1),
	checkAndAdd(L1, L).

checkAndAdd([], []).

checkAndAdd([H|T], L) :-
	append([], [1,1|_], H),
	checkAndAdd(T, L1),
	append([[0|H]], L1, L).

checkAndAdd([H|T], L) :-
	append([], [0,0|_], H),
	checkAndAdd(T, L1),
	append([[1|H]], L1, L).

checkAndAdd([H|T], L) :-
	append([], [0,1|_], H),
	checkAndAdd(T, L1),
	append([[0|H]], [[1|H]], X),
	append(X, L1, L).

checkAndAdd([H|T], L) :-
	append([], [1,0|_], H),
	checkAndAdd(T, L1),
	append([[0|H]], [[1|H]], X),
	append(X, L1, L).



