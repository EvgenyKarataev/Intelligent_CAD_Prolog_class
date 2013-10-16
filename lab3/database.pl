:-op(100,xfx,['рекомендуется', 'ставит','has','has symptom','has priznak', 'ходил на лекции', 'сдал', 'имеет']).

:- dynamic 'ходил на лекции'/2, 'сдал'/2.

askable(_'ходил на лекции'_).
askable(_'имеет'_).

clause_cf(X 'рекомендуется' 'ходить на лекции',
	('преподаватель' 'ставит' 'баллы за лекции',
	not(X 'сдал' 'лабораторные работы')), 0.9).

clause_cf(
X 'рекомендуется' 'ходить на лекции',
	(X 'имеет' 'мало балов',
	X 'имеет' 'злого преподавателя'), 0.8).

clause_cf(
X 'рекомендуется' 'сдавать лабы',
	(X 'имеет' 'конец семестра',
	X 'имеет' 'мало балов', 0.8).

clause_cf(
X 'рекомендуется' 'собирать вещи в армию',
	(X 'рекомендуется' 'сдавать лабы', 0.7).

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
	member(Y, ['ходить на лекции', 'сдавать лабы']),
	X 'рекомендуется' Y.

system(member(_,_)).



