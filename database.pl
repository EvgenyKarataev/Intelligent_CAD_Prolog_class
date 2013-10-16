:-op(100,xfx,['рекомендуется','has','has symptom','has priznak']).

:- dynamic 'ходил на лекции'/2, 'сдал лабы'/2.

askable(_'ходил на лекции'_).
askable(_'сдал лабы'_).

clause_cf(X 'рекомендуется' 'ходить на лекции',
	(X '' 'cold',
	not(X 'has' 'bad age')), 0.9).

X 'recomend' 'call doctor' :-
	X 'has' 'cold',
	X 'has' 'bad age'.

X 'recomend' 'call doctor' :-
	X 'has' 'bad faringit'.

clause_cf(
X 'recomend' 'go to bed and take aspirin',
	X 'has' 'fly', 0.7).

clause_cf(
X 'has' 'cold', (
	X 'has symptom' 'muscular acke',
	X 'has symptom' 'lihoradka'), 0.8).

X 'has' 'bad age' :-
	X 'has priznak' 'younger 8 years'.
X 'has' 'bad age' :-
	X 'has priznak' 'older 60 years'.

clause_cf(
X 'has' 'bad faringit',
(   	X 'has symptom' 'lihoradka',
	X 'has symptom' 'sore throat'), 0.9).

clause_cf(
X 'has' 'fly', (
	X 'has symptom' 'nose',
	X 'has symptom' 'muscular acke',
	not(X 'has symptom' 'lihoradka')), 0.8).

hy(X, Y) :-
	member(Y, ['go to bed and take aspirin', 'call doctor']),
	X 'recomend' Y.

system(member(_,_)).



