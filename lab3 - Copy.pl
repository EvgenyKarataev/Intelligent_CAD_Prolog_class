:- multifile system/1, askable/1.
:- dynamic untrue/1, askable/1.
solve(true) :- !.
solve((A, B)) :- !,
	solve(A),
	solve(B).
solve(not(A)) :- !,
	not(solve(A)).
solve(A) :-
	not(system(A)),
	clause(A, B),
	solve(B).
solve(A) :-
	system(A),
	A.
solve(A) :-
	askable(A),
	not(known(A)),
	ask(A, Answer),
	respond(Answer, A).

system(is(_,_)).
system(_=_).
system(_<_).
system(_>_).
system(write(_)).
system(nl).

ask(A, Answer) :-
	display_query(A),
	read(Answer).

respond(yes, A) :-
	assert(A).
respond(no, A) :-
	assert(untrue(A)), fail.

known(A) :- A, !.
known(A) :-
	untrue(A).

display_query(A) :-
	write(A),
	write('?').
