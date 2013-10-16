goal(state(_,_,_,yes)).

printList([]).

printList([H|T]) :-
	write(H), nl,
	printList(T).

solve(Start, Solve) :-
	depth([], Start, Solve).

depth(P, X, [X|P]) :-
	goal(X).

depth(P, X, Solve) :-
	next(X, X1),
	not(member(X1, P)),
	depth([X|P], X1, Solve).
place(center).
place(window).
place(door).
%--------------------------------------------------------------
next(state(center,yes,center,no),state(center,yes,center,yes)).
%--------------------------------------------------------------
next(state(X,no,X,no),state(X,yes,X,no)).
next(state(X,yes,X,no),state(X,no,X,no)).
%--------------------------------------------------------------
next(state(X,no,Y,no),X1):-
	X\=door, X1=state(door,no,Y,no).
next(state(X,no,Y,no),X1):-
	X\=window, X1=state(window,no,Y,no).
next(state(X,no,Y,no),X1):-
	X\=center, X1=state(center,no,Y,no).
%--------------------------------------------------------------
next(state(X,no,X,no),X1):-
	X\=door, X1=state(door,no,door,no).
next(state(X,no,X,no),X1):-
	X\=window, X1=state(window,no,window,no).
next(state(X,no,X,no),X1):-
	X\=center, X1=state(center,no,center,no).






