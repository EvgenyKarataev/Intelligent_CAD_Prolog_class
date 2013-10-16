:- op(100, xfx, ['�������������', '�����', '����� �������', '����� �������']).

:- dynamic untrue/1, explainThis/1, '����� �������'/2, '����� �������'/2,
	askable/1.

solve(true, true) :- !.

solve((A,B),(ProofA,ProofB)) :-	!,
	solve(A,ProofA),
	solve(B,ProofB).
solve(not(A),'�� ���������'(A)):-!,
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

askable(_ '����� �������' _).
askable(_ '����� �������' _).

interpret((ProofA,ProofB)):- !,
	interpret(ProofA),
	interpret(ProofB).
interpret((A:-'��� ���� �������')) :- !,
	nl, write(A), write('<= ��� ���� �������'), nl.
interpret('�� ���������'(A)) :- !,
	nl, write(A), write('<= �� ���������'), nl.
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
extract_body('�� ���������'(B), not(B)).

display_rule(rule(A,B)) :-
	nl, write('���� '),
	write_conjunction(B),
	write(' �� '),
	write(A), nl.

write_conjunction((A,B)) :-
	!, write(A), write(' � '),
	write_conjunction(B).
write_conjunction(A) :-
	write(A), nl.

explainRule(Head, Body) :-
	explainThis(Head), !,
	nl, write(Head),
	write(' �������� � ������������� ������� '),
	display_rule(rule(Head, Body)).

explainRule(_,_).

explainFact(Fact) :-
	explainThis(Fact), !,
	nl, write(Fact), write(' - ��� ����'), nl.
explainFact(_).

X '�������������' '���':-
	X '�����' '��������',
	not(X '�����' '�������� �������').
%X '�������������' '������� �����':-
%	X '�����' '��������',
%	X '�����' '�������� �������'.
%X '�������������' '������� �����':-
%	X '�����' '������ ��������'.
X '�������������' '���' :-
	X '�����' '�����'.

X '�����' '��������' :-
        X '����� �������' '�������� ����',
	X '����� �������' '���������'.
X '�����' '�������� �������' :-
        X '����� �������' '������ 8 ���'.
X '�����' '�������� �������' :-
        X '����� �������' '������ 60 ���'.
X '�����' '������ ��������' :-
        X '����� �������' '���������',
	X '����� �������' '������ � �����'.
X '�����' '�����' :-
        X '����� �������' '�������',
	X '����� �������' '�������� ����',
	not(X '����� �������' '���������').

hy(X, Y) :-
	member(Y, ['���', '������� �����']),
	X '�������������' Y.

explainThis(_ '�������������' _).

how(Goal) :-
	solve(Goal, Proof),
	interpret(Proof).










