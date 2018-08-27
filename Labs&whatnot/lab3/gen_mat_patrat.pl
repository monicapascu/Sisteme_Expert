%Author: Pascu Monica-Nicoleta CTI351
%Date: 18/04/2018


%a)
% creeaza o matrice dintr-o lista

list_to_matrix([], _, []).
list_to_matrix(List, Size, [Row|Matrix]):-
  list_to_matrix_row(List, Size, Row, Tail),
  list_to_matrix(Tail, Size, Matrix).

list_to_matrix_row(Tail, 0, [], Tail).
list_to_matrix_row([Item|List], Size, [Item|Row], Tail):-
  NSize is Size-1,
  list_to_matrix_row(List, NSize, Row, Tail).
 
% genereaza o lista cu acelasi element, repetat de n ori. 
gen_list(_,0,[]) :-!. 
gen_list(I,N,[I|Is]) :- 
         N1 is N-1,
         gen_list(I,N1,Is).
		 
		 
matrice_chr(N,Chr,M) :-
gen_list(Chr,N*N,L),
list_to_matrix(L,N,M).

/*
| ?- matrice_chr(4,a,M).                                                   
M = [[a,a,a,a],[a,a,a,a],[a,a,a,a],[a,a,a,a]] ? ;
no
| ?- matrice_chr(4,B,M).                                                      
M = [[B,B,B,B],[B,B,B,B],[B,B,B,B],[B,B,B,B]] ? ;
no
| ?- 
*/

%b)
