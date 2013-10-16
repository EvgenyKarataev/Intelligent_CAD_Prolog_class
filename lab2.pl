printList([]).

printList([H|T]) :-
	write(H), nl,
	printList(T).

solve(Start, Solve) :-
	depth([], Start, Solve),
	printList(Solve).

depth(P, X, [X|P]) :-
	goal(X).

depth(P, X, Solve) :-
	next(X, X1),
	not(member(X1, P)),
	depth([X|P], X1, Solve).

goal(S) :- S = [10, 10, 10, 0].

next([B, S1, S2, S3], X) :-
	B > 0, B \= 10, S1 \= 10,
	Delta is 14 - S1, Delta > 0,
	((B > Delta, B1 is B - Delta, S11 is S1 + Delta);
	(B1 = 0, S11 is S1 + B)),
	B1 < 30, S11 < 14, S2 < 12, S3 < 6,
	X = [B1, S11, S2, S3].

next([B, S1, S2, S3], X) :-
	B > 0,B \= 10, S2 \= 10,
	Delta is 12 - S2, Delta > 0,
	((B > Delta, B1 is B - Delta, S21 is S2 + Delta);
	(B1 = 0, S21 is S2 + B)),
	B1 < 30, S1 < 14, S21 < 12, S3 < 6,
	X = [B1, S1, S21, S3].

next([B, S1, S2, S3], X) :-
	B > 0, B \= 10, S3 \= 10,
	Delta is 6 - S3, Delta > 0,
	((B > Delta, B1 is B - Delta, S31 is S3 + Delta);
	(B1 = 0, S31 is S3 + B)),
	B1 < 30, S1 < 14, S2 < 12, S31 < 6,
	X = [B1, S1, S2, S31].

%-----------------------------------------
next([B, S1, S2, S3], X) :-
        S1 > 0, S1 \= 10, B \= 10,
	Delta is 30 - B, Delta > 0,
	((S1 > Delta, S11 is S1 - Delta, B1 is B + Delta);
	(S11 = 0, B1 is B + S1)),
	B1 < 30, S11 < 14, S2 < 12, S3 < 6,
	X = [B1, S11, S2, S3].

next([B, S1, S2, S3], X) :-
	 S1 > 0, S1 \= 10, S2 \= 10,
	Delta is 12 - S2, Delta > 0,
	((S1 > Delta, S11 is S1 - Delta, S21 is S2 + Delta);
	(S11 = 0, S21 is S2 + S1)),
	B < 30, S11 < 14, S21 < 12, S3 < 6,
	X = [B, S11, S21, S3].

next([B, S1, S2, S3], X) :-
	 S1 > 0, S1 \= 10, S3 \= 10,
	Delta is 6 - S3, Delta > 0,
	((S1 > Delta, S11 is S1 - Delta, S31 is S3 + Delta);
	(S11 = 0, S31 is S3 + S1)),
	B < 30, S11 < 14, S2 < 12, S31 < 6,
	X = [B, S11, S2, S31].

%-----------------------------------------
next([B, S1, S2, S3], X) :-
	S2 > 0, S2 \= 10, B \= 10,
	Delta is 30 - B, Delta > 0,
	((S2 > Delta, S21 is S2 - Delta, B1 is B + Delta);
	(S21 = 0, B1 is B + S2)),
	B1 < 30, S1 < 14, S21 < 12, S3 < 6,
	X = [B1, S1, S21, S3].

next([B, S1, S2, S3], X) :-
	S2 > 0, S2 \= 10, S1 \= 10,
	Delta is 14 - S1, Delta > 0,
	((S2 > Delta, S21 is S2 - Delta, S11 is S1 + Delta);
	(S21 = 0, S11 is S1 + S2)),
	B < 30, S11 < 14, S21 < 12, S3 < 6,
	X = [B, S11, S21, S3].

next([B, S1, S2, S3], X) :-
	S2 > 0, S2 \= 10, S3 \= 10,
	Delta is 6 - S3, Delta > 0,
	((S2 > Delta, S21 is S2 - Delta, S31 is S3 + Delta);
	(S21 = 0, S31 is S3 + S2)),
	B < 30, S1 < 14, S21 < 12, S31 < 6,
	X = [B, S1, S21, S31].
%-----------------------------------------------
next([B, S1, S2, S3], X) :-
	S3 > 0, S3 \= 10, B \= 10,
	Delta is 30 - B, Delta > 0,
	((S3 > Delta, S31 is S3 - Delta, B1 is B + Delta);
	(S31 = 0, B1 is B + S3)),
	B1 < 30, S1 < 14, S2 < 12, S31 < 6,
	X = [B1, S1, S2, S31].

next([B, S1, S2, S3], X) :-
	 S3 > 0, S3 \= 10, S1 \= 10,
	Delta is 14 - S1, Delta > 0,
	((S3 > Delta, S31 is S3 - Delta, S11 is S1 + Delta);
	(S31 = 0, S11 is S1 + S3)),
	B < 30, S11 < 14, S2 < 12, S31 < 6,
	X = [B, S11, S2, S31].

next([B, S1, S2, S3], X) :-
	S3 > 0, S3 \= 10, S2 \= 10,
	Delta is 12 - S2, Delta > 0,
	((S3 > Delta, S31 is S3 - Delta, S21 is S2 + Delta);
	(S31 = 0, S21 is S2 + S3)),
	B < 30, S1 < 14, S21 < 12, S31 < 6,
	X = [B, S1, S21, S31].








