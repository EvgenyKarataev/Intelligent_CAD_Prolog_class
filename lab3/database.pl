:-op(100,xfx,['�������������', '������','has','has symptom','has priznak', '����� �� ������', '����', '�����']).

:- dynamic '����� �� ������'/2, '����'/2.

askable(_'����� �� ������'_).
askable(_'�����'_).

clause_cf(X '�������������' '������ �� ������',
	('�������������' '������' '����� �� ������',
	not(X '����' '������������ ������')), 0.9).

clause_cf(
X '�������������' '������ �� ������',
	(X '�����' '���� �����',
	X '�����' '����� �������������'), 0.8).

clause_cf(
X '�������������' '������� ����',
	(X '�����' '����� ��������',
	X '�����' '���� �����', 0.8).

clause_cf(
X '�������������' '�������� ���� � �����',
	(X '�������������' '������� ����', 0.7).

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
	member(Y, ['������ �� ������', '������� ����']),
	X '�������������' Y.

system(member(_,_)).



