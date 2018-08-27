
list_sum([X], X).
list_sum([X1,X2 | T], Total) :-
    list_sum([X1+X2|Tail], Total).
	
rowN([H|_],1,H):-!.
rowN([_|T],I,X) :-
    I1 is I-1,
    rowN(T,I1,X).

columnN([],_,[]).
columnN([H|T], I, [R|X]):-
   rowN(H, I, R), 
columnN(T,I,X).

suma_col([L|LR],Nr,[]):-
length(L,N2),
  N > N2.
  
suma_col(M,Nr,S):-
Nr is 1,
columnN(M,Nr,Col),
list_sum(Col,S),
append(Empty_List,S,FinalList),
Nr2 is Nr+1,
suma_col(M,Nr2,S).

Empty_List=[].

suma(M,L):-
suma_col(M,1,L).




