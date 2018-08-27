% Author: Pascu Monica-Nicoleta CTI351
% Date: 07/04/2018

% element_coloana2(+L, +Poz_curenta, +Poz_finala, -Elem)
% parcurge L si extrage elementul Elem de pe pozitia Poz_finala

element_coloana2([Elem|_], Poz_finala, Poz_finala, Elem):- !.

element_coloana2([_|LT], Poz_curenta, Poz_finala, Elem):- Poz_curenta < Poz_finala, Poz_curenta2 is Poz_curenta + 1,
element_coloana2(LT, Poz_curenta2, Poz_finala, Elem).
	
	
% element_coloana(+L, +Poz, -Elem)
% returneaza elementul Elem de pe pozitia Poz din lista L

element_coloana(L, Poz, Elem):- element_coloana2(L, 1, Poz, Elem).
 

% diagonala2(+L, +N, +NP)  
diagonala2([],_,_).

% verifica daca elementul N de pe diagonala princiapala (de pe pozitia N,N in matrice) este multiplu al lui N-1 (NP/Numar precedent)
diagonala2([LH|LT], N, NP):- element_coloana(LH, N, Element), integer(Element), Element > 0, 0 is Element mod NP, N2 is N + 1,
diagonala2(LT, N2, Element).
 
% diagonala(+M, -L)
diagonala(M):- diagonala2(M, 1, 1).

/*
| ?- diagonala([[2,15,1],[5,10,2],[10,5,50]]).
yes
| ?- diagonala([[2,15,1],[5,9,2],[10,5,50]]). 
no
*/

