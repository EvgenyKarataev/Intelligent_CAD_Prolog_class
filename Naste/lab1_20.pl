p1([],_,[]).

p1([H|T],Y,R):-
	member(H,Y),
	p1(T,Y,R).

p1([H|T],Y,[H|R]):-
	not(member(H,Y)),
	p1(T,Y,R).

p(X,Y,Z):-
	p1(X,Y,Z1),
	p1(Y,X,Z2),
	append(Z1,Z2,Z).

