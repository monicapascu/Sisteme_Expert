% Author: Pascu Monica-Nicoleta CTI351
% Date: 07/04/2018


% element_coloana2(+L, +Poz_curenta, +Poz_finala, -Elem)
% parcurge L si extrage elementul Elem de pe pozitia Poz_finala

element_coloana2([Elem|_], Poz_finala, Poz_finala, Elem):- !.

element_coloana2([_|LT], Poz_curenta, Poz_finala, Elem):- Poz_curenta < Poz_finala, Poz_curenta2 is Poz_curenta + 1,
element_coloana2(LT, Poz_curenta2, Poz_finala, Elem).


%element_coloana(+L, +Poz, -Elem)
% ca la element_coloana din mat list diagonala unu doar ca cu un twist in sensul ca o ia invers
element_coloana(L, Poz, Elem):- length(L, Lungime), Poz2 is Lungime - Poz + 1, element_coloana2(L, 1, Poz2, Elem).
 
%diagonala2(+L, +N, -L_Diagonala)
diagonala2([],_,[]).
diagonala2([LH|LT], N, [Elem|L_Diagonala]):- element_coloana(LH, N, Elem), N2 is N + 1, diagonala2(LT, N2, L_Diagonala).
 

%diagonala(+M, -L)
diagonala(M, L):- diagonala2(M, 1, L).
	
	
%PART 2

%diagonala_semn(+M)
diagonala_semn(M):- diagonala(M, L), bagof(Elem, Y^(member(Y, L), Elem is Y, Elem >= 0), Lista), write(Lista),length(L, L_length), length(Lista, L_length).
	
	
	
/*

| ?- diagonala_semn([[1-1,2+3,4+5],[5,2+3+4,1*2],[10-1,2+3-5,0]]).
[9,9,9]
yes
| ?- diagonala_semn([[1-1,2+3,4+5],[5,2-3-4,1*2],[10-1,2+3-5,0]]).
[9,9]
no
| ?- 

*/