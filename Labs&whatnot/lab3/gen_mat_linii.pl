%Author: Pascu Monica-Nicoleta CTI351
%Date: 15/04/2018

%creez o lista cu elemente de la 1 la Max
pred(1, [1]).
pred(N, [N|T]) :-
    N > 1,
    N1 is N-1,
    pred(N1, T).
	
% creeaza o matrice dintr-o lista

list_to_matrix([], _, []).
list_to_matrix(List, Size, [Row|Matrix]):-
  list_to_matrix_row(List, Size, Row, Tail),
  list_to_matrix(Tail, Size, Matrix).

list_to_matrix_row(Tail, 0, [], Tail).
list_to_matrix_row([Item|List], Size, [Item|Row], Tail):-
  NSize is Size-1,
  list_to_matrix_row(List, NSize, Row, Tail).
	
patrat(N,Max,Mat) :- 
    Nr is Max-1,
	pred(Nr,L),
	sort(L,NewL),
	I is 0,
	X is N*N-Max+1,
	gen_list(I,X,Zeros),
	append(NewL,Zeros,FinalL),
	list_to_matrix(FinalL,N,Mat).
	
	
% genereaza o lista cu acelasi element, repetat de n ori.
% gen daca am max = 5, genereaza o lista de 5 zero-uri pe care o adauga la lista creeata anterior,
% pe care mai apoi o sa o transfor in matrice
	
gen_list(_,0,[]) :-!. 
gen_list(I,N,[I|Is]) :- 
         N1 is N-1,
         gen_list(I,N1,Is).
		 
/*

| ?- patrat(3,5,M).                                                       
M = [[1,2,3],[4,0,0],[0,0,0]] ? ;
no
| ?- patrat(3,9,M).
M = [[1,2,3],[4,5,6],[7,8,0]] ? ;
no
| ?- patrat(3,10,M).
M = [[1,2,3],[4,5,6],[7,8,9]] ? ;
no

*/
