press(P,L):-
	name(P,V),
	del_double(V,[C|CT]),
	del_glas(CT,C1),
	append([C],C1,PP),
	del_double(PP,L1),
	first_n(L1,L2,4),
	name(L,L2).

del_glas([],[]).
del_glas([X|XL],YL):-
	glasn_yhw(X),
	del_glas(XL,YL).
del_glas([Z|XL],[Z|YL]):-
	not(glasn_yhw(Z)),
	del_glas(XL,YL).

glasn_yhw(X):-
	name(aeuoiyhw,K),
	member(X,K).

first_n([],[],_).
first_n(_,[],0).
first_n([X|LX],[X|KX],N):-
	N>0,
	N1 is N-1,
	first_n(LX,KX,N1).

del_double([],[]).
del_double([C],[C]).
del_double([X,X|XT],[X|XP]):-
	del_double(XT,XP).
del_double([X,A|XL],[X,A|XK]):-
	X\=A,
	del_double([A|XL],[A|XK]).
