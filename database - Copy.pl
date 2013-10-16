:-op(100,xfx,['recomend','has','has symptom','has priznak']).

:- dynamic 'has symptom'/2, 'has priznak'/2.

askable(_'has symptom'_).
askable(_'has priznak'_).

X 'recomend' 'go to bed and take aspirin':-
	X 'has' 'cold',
	not(X 'has' 'bad age').

X 'recomend' 'call doctor' :-
	X 'has' 'cold',
	X 'has' 'bad age'.

X 'recomend' 'call doctor' :-
	X 'has' 'bad faringit'.

X 'recomend' 'go to bed and take aspirin' :-
	X 'has' 'fly'.

X 'has' 'cold' :-
	X 'has symptom' 'muscular acke',
	X 'has symptom' 'lihoradka'.
X 'has' 'bad age' :-
	X 'has priznak' 'younger 8 years'.
X 'has' 'bad age' :-
	X 'has priznak' 'older 60 years'.
X 'has' 'bad faringit' :-
	X 'has symptom' 'lihoradka',
	X 'has symptom' 'sore throat'.

X 'has' 'fly' :-
	X 'has symptom' 'nose',
	X 'has symptom' 'muscular acke',
	not(X 'has symptom' 'lihoradka').

hy(X, Y) :-
	member(Y, ['go to bed and take aspirin', 'call doctor']),
	X 'recomend' Y.

system(member(_,_)).
