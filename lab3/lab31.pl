:- multifile system/1, askable/1, clause_cf/3.
:- dynamic untrue/1, askable/1, clause_cf/3.

expert(X) :-
	solve(X, _, C), nl,
	write('proved with sure'),
	write(C).

solve(true, _, 1) :- !.
solve((A, B), Rules, C) :- !,
	solve(A, Rules, C1),
	solve(B, Rules, C2),
	C is min(C1, C2).
solve(not(A), _, 1) :- !,
	not(solve(A, _, _)).
solve(A, Rules, C) :-
	not(system(A)),
	clause(A, B),
	solve(B, [rule(A, B)|Rules], C).
solve(A, Rules, C) :-
	not(system(A)),
	clause_cf(A, B, C1),
	solve(B, [rule(A, B)|Rules], C2),
	C is C1 * C2.
solve(A, _, 1) :-
	system(A),
	A.
solve(A, Rules, C) :-
	askable(A),
	not(known(A)),
	ask(A, Answer),
	respond(Answer, A, Rules, C).


system(is(_,_)).
system(_=_).
system(_<_).
system(_>_).
system(write(_)).
system(nl).

ask(A, Answer) :-
	display_query(A),
	read(Answer).

respond(yes, A, _, 1) :-
	assert(A).
respond(no, A, _, 0) :-
	assert(untrue(A)), fail.
respond(why, A, Rules, C) :-
	var(Rules), !,
	write('want to use lie'),
	write(A), nl,
	ask(A, Answer),
	respond(Answer, A, [], C).
respond(why, A, [Rule|Rules], C) :-
	write('want to use rule:'),
	display_rule(Rule),
	ask(A, Answer),
	respond(Answer, A, Rules, C).
respond(why, A, [], C) :-
	write(' <== probably no rules left'), nl,
	ask(A, Answer),
	respond(Answer, A, [], C).
respond(C, A, _, C) :-
	number(C), C > 0,
	assert(clause_cf(A, true, C)).
respond(0, A, _, 0) :-
	assert(untrue(A)), fail.

known(A) :-
	clause_cf(A, true, _), !.
known(A) :- A, !.
known(A) :-
	untrue(A).

display_query(A) :-
	write(A),
	write('?').

display_rule(rule(A, B)) :-
	nl, write('If'),
	write_conjunction(B),
	write(' then '),
	write(A), nl.

write_conjunction((A, B)) :-
	!, write(A), write(' and '),
	write_conjunction(B).
write_conjunction(A) :-
	write(A), nl.
