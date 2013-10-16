:- op(100, xfx, ['рекомендовано', 'имеет', 'имеет симптом', 'имеет признак']).

:- dynamic untrue/1, explainThis/1, 'имеет симптом'/2, 'имеет признак'/2,
	askable/1.

solve(true, true) :- !.

solve((A,B),(ProofA,ProofB)) :-	!,
	solve(A,ProofA),
	solve(B,ProofB).
solve(not(A),'не доказуемо'(A)):-!,
	not(solve(A,_)).
solve(A,(A:-Proof)) :-
	not(system(A)),
	clause(A,B),
	solve(B,Proof).
solve(A,(A:-true)) :-
	system(A),
	A.
system(A) :-
	askable(A),
	not(known(A)),
	ask(A,Answer),
	respond(Answer,A).

system(is(_,_)).
system(_=_).
system(_<_).
system(_>_).
system(write(_)).
system(nl).
system(member(_,_)).

ask(A,Answer) :-
	display_query(A),
	read(Answer).

respond(yes,A) :-
	assert(A).
respond(no,A) :-
	assert(untrue(A)),fail.

known(A) :- A,!.
known(A) :-
	untrue(A).

display_query(A) :-
	write(A),
	write('?').

askable(_ 'имеет симптом' _).
askable(_ 'имеет признак' _).

interpret((ProofA,ProofB)):- !,
	interpret(ProofA),
	interpret(ProofB).
interpret((A:-'как было сказано')) :- !,
	nl, write(A), write('<= как было сказано'), nl.
interpret('не доказуемо'(A)) :- !,
	nl, write(A), write('<= не доказуемо'), nl.
interpret(Proof) :-
	fact(Proof,Fact),
	explainFact(Fact).
interpret(Proof) :-
	rule(Proof,Head,Body,Proof1),
	explainRule(Head,Body),
	interpret(Proof1).

fact((Fact:-true),Fact).

rule((Goal:-Proof),Goal,Body,Proof) :-
	not(Proof = true),
	extract_body(Proof,Body).

extract_body((ProofA,ProofB),(BodyA,BodyB)) :-
	!,
	extract_body(ProofA,BodyA),
	extract_body(ProofB,BodyB).
extract_body((Goal:-Proof), Goal).
extract_body('не доказуема'(B), not(B)).

display_rule(rule(A,B)) :-
	nl, write('≈сли '),
	write_conjunction(B),
	write(' то '),
	write(A), nl.

write_conjunction((A,B)) :-
	!, write(A), write(' и '),
	write_conjunction(B).
write_conjunction(A) :-
	write(A), nl.

explainRule(Head, Body) :-
	explainThis(Head), !,
	nl, write(Head),
	write(' доказано с исползованием правила '),
	display_rule(rule(Head, Body)).

explainRule(_,_).

explainFact(Fact) :-
	explainThis(Fact), !,
	nl, write(Fact), write(' - это факт'), nl.
explainFact(_).

X 'рекомендовано' 'леч':-
	X 'имеет' 'простуда',
	not(X 'имеет' 'у€звимый возраст').
%X 'рекомендовано' 'вызвать врача':-
%	X 'имеет' 'простуда',
%	X 'имеет' 'у€звимый возраст'.
%X 'рекомендовано' 'вызвать врача':-
%	X 'имеет' 'острый фарингит'.
X 'рекомендовано' 'леч' :-
	X 'имеет' 'грипп'.

X 'имеет' 'простуда' :-
        X 'имеет симптом' 'мышечные боли',
	X 'имеет симптом' 'лихорадка'.
X 'имеет' 'у€звимый возраст' :-
        X 'имеет признак' 'моложе 8 лет'.
X 'имеет' 'у€звимый возраст' :-
        X 'имеет признак' 'старше 60 лет'.
X 'имеет' 'острый фарингит' :-
        X 'имеет симптом' 'лихорадка',
	X 'имеет симптом' 'нарывы в горле'.
X 'имеет' 'грипп' :-
        X 'имеет симптом' 'насморк',
	X 'имеет симптом' 'мышечные боли',
	not(X 'имеет симптом' 'лихорадка').

hy(X, Y) :-
	member(Y, ['леч', 'вызвать врача']),
	X 'рекомендовано' Y.

explainThis(_ 'рекомендовано' _).

how(Goal) :-
	solve(Goal, Proof),
	interpret(Proof).










