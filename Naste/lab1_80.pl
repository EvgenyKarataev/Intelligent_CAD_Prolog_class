functor1(A,X,Y):-
	A =.. [H|T],
	X = H,
	length(T,Y).

p(1,[H|_],Y) :-
	Y=H.
p(X,[_|T],Y) :-
	K is X-1,
	p(K,T,Y).

arg1(X,M,Y):-
	M =.. [_|T],
	p(X,T,Y).
