mem(X, []) :- false.

mem(X, [H|T]) :-
	(   (member(X, H), true);
	(   mem(X, T))).
