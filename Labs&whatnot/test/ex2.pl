
%a
%creez o lista cu elemente de la N (adica maximul, B-1) pana la A.
pred(1,_,[1]).
pred(N,A,Pas,[N|T]) :-
    N > A,
    N1 is N-Pas,
    pred(N1,A,Pas,T).
	
%sortez lista crescator
quicksort([X|Xs],Ys) :-
  partition(Xs,X,Left,Right),
  quicksort(Left,Ls),
  quicksort(Right,Rs),
  append(Ls,[X|Rs],Ys).
quicksort([],[]).

	
int(A,B,Pas,Lrez):-
B>A,
Nr is B-1,
pred(Nr,A,Pas,L),
quicksort(L,Lrez).

%d


at(Mat, Row, Col, Val) :- nth1(Row, Mat, ARow), nth1(Col, ARow, Val).

pred_m(M,I1,J1,I2,J2,Mnou):- at(M,I1,J1,Nr1), at(M,I2,J2,Nr2). 