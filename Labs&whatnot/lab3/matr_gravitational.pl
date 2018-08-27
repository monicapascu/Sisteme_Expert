%Author: Pascu Monica-Nicoleta CTI351
%Date: 15/04/2018

rowN([H|_],1,H):-!.
rowN([_|T],I,X) :-
    I1 is I-1,
    rowN(T,I1,X).

columnN([],_,[]).
columnN([H|T], I, [R|X]):-
   rowN(H, I, R), 
columnN(T,I,X).

%columnN ia coloana N din matrice 
%exemplu: columnN([[0,0,0,1,0],[0,0,1,0,0],[1,0,0,0,1],[0,0,0,1,1],[0,0,1,0,0]],5,M).
% = [0,0,1,1,0] aka a 5a coloana
	
arrange([L|LR],N,[]):-
  %caz de oprire, am terminat cand N > numarul de coloane
  length(L,N2),
  N > N2.
  
  
  
arrange(M,N,[LH|LT]):- 
  columnN(M,N,Col),
  quicksort(Col,LH),
  N2 is N+1,
  arrange(M,N2,LT).
  

matr_grav(MatInit, MatFinal):-
    arrange(MatInit,1, MatAranjata),
	transpose(MatAranjata,MatFinal).
	
matrice_test(m1, [[1,1,1],[0,0,0],[0,0,0]]).
matrice_test(m2, [[0,0,0,1,0],[0,0,1,0,0],[1,0,0,0,1],[0,0,0,1,1],[0,0,1,0,0]]). %matricea din exemplu
matrice_test(m3, [[1,1],[1,1]]).
matrice_test(m4, [[0,0],[1,0],[1,0],[0,1]]).


%-----quicksort------

quicksort([X|Xs],Ys) :-
  partition(Xs,X,Left,Right),
  quicksort(Left,Ls),
  quicksort(Right,Rs),
  append(Ls,[X|Rs],Ys).
quicksort([],[]).

partition([],Y,[],[]).
partition([X|Xs],Y,[X|Ls],Rs) :-
  X =< Y, partition(Xs,Y,Ls,Rs).
partition([X|Xs],Y,Ls,[X|Rs]) :-
  X > Y, partition(Xs,Y,Ls,Rs).


%------transpusa------

transpose([A|As], At) :-
    transpose(A, [A|As], At).

transpose([],_,[]).
transpose([_|As], Rest, [At|Ats]) :-
    first_column(Rest, At, NewRest),
    transpose(As, NewRest, Ats).

first_column([], [], []).
first_column([[A|As]|Ass], [A|Acc], [As|Rest]) :-
first_column(Ass, Acc, Rest).


% exemple interogari

/*
| ?- matrice_test(_, M), matr_grav(M, M2).                                   
M = [[1,1,1],[0,0,0],[0,0,0]],
M2 = [[0,0,0],[0,0,0],[1,1,1]] ? ;
M = [[0,0,0,1,0],[0,0,1,0,0],[1,0,0,0,1],[0,0,0,1,1],[0,0,1,0,0]],
M2 = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,1,1,1],[1,0,1,1,1]] ? ;
M = [[1,1],[1,1]],
M2 = [[1,1],[1,1]] ? ;
M = [[0,0],[1,0],[1,0],[0,1]],
M2 = [[0,0],[0,0],[1,0],[1,1]] ? 
*/