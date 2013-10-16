:-multifile system/1, askable/1, clause_cf/3, explainThis/1.
:-dynamic   untrue/1, askable/1, clause_cf/3, explainThis/1.

expert:-
	write('Введите цель: '),
	read(Goal),
	solve(Goal,[],C,Proof),nl,
	nl, write('Доказано '),write(Goal),
	write(' с уверенностью '),write(C),nl,
	write('Объясняем вывод:'),nl,
	interpret(Proof), nl.

solve(true,_,1,true):-!.

solve((A,B),Rules,C,(ProofA,ProofB)):-!,
	solve(A,Rules,C1,ProofA),
	solve(B,Rules,C2,ProofB),
	C is min(C1,C2).

solve(not(A),_,1,'не доказуемо'(A)):-!,
	not(solve(A,_,_,_)).

solve(A,Rules,C,(A:-Proof)):-
	not(system(A)),
	clause(A,B),
	solve(B,[rule(A,B)|Rules],C,Proof).

solve(A,Rules,C,(A:-Proof)):-
	not(system(A)),
	clause_cf(A,B,C1),
	solve(B,[rule(A,B)|Rules],C2,Proof),
	C is C1*C2.

solve(A,_,1,(A:-true)):-
	system(A),
	A.

solve(A,Rules,C,Proof):-
	askable(A),
	not(known(A)),
	ask(A,Answer),
	respond(Answer,A,Rules,C,Proof).

system(is(_,_)).
system(_=_).
system(_<_).
system(_>_).
system(write(_)).
system(nl).

ask(A,Answer):-
	display_query(A),
	read(Answer).

respond(yes,A,_,1,(A:-true)):-
	assert(A).

respond(no,A,_,0,_):-
	assert(untrue(A)),fail.

respond(why,A,Rules,C,_):-
	var(Rules),!,
	write(' хочу использовать ложность'),
	write(A),nl,
	ask(A,Answer),
	respond(Answer,A,[],C,_).

respond(why,A,[Rule|Rules],C,_):-
	write(' хочу воспользоваться правилом:'),
	display_rule(Rule),
	ask(A,Answer),
	respond(Answer,A,Rules,C,_).

respond(why,A,[],C,_):-
	write('<== возможности объяснения исчерпаны'),nl,
	ask(A,Answer),
	respond(Answer,A,[],C,_).

respond(C,A,_,C,(A:-true)):-
	number(C),C>0,
	assert(clause_cf(A,true,C)).

respond(0,A,_,0,_):-
	assert(untrue(A)),fail.

known(A):-
	clause_cf(A,true,_),!.

known(A):-A,!.

known(A):-
	untrue(A).

display_query(A):-
	write(A),
	write('?').


display_rule(rule(A,B)):-
	nl,write('Если '),
	write_conjunction(B),
	write(' то '),
	write(A),nl.

write_conjunction((A,B)):-
	!,write(A),write(' и '),
	write_conjunction(B).

write_conjunction(A):-
	write(A),nl.

interpret((ProofA,ProofB)):-!,
	interpret(ProofA),
	interpret(ProofB).

interpret((member(_,_):-true)) :- !.

interpret((A:-true)):-!,nl,
	write(A),write('<= как было сказано'),nl.

interpret('не доказуемо'(A)):-!,
	nl,write(A),write('<= не доказуемо'),nl.

interpret(Proof):-
	fact(Proof,Fact),
	explainFact(Fact).

interpret(Proof):-
	rule(Proof,Head,Body,Proof1),
	explainRule(Head,Body),
	interpret(Proof1).

fact((Fact:-true),Fact).

rule((Goal:-Proof),Goal,Body,Proof):-
	not(Proof=true),
	extract_body(Proof,Body).

extract_body((ProofA,ProofB),(BodyA,BodyB)):-
	!,
	extract_body(ProofA,BodyA),
	extract_body(ProofB,BodyB).

extract_body((Goal:-_),Goal).

extract_body('не доказуемо'(B),not(B)).

explainRule(Head,Body):-
	explainThis(Head),!,
	nl,write(Head),
	write(' доказано с использованием правила '),
	display_rule(rule(Head,Body)).

explainRule(_,_).

explainFact(Fact):-
	explainThis(Fact),!,
	nl,write(Fact),write('- это факт'),nl.

explainFact(_).


























