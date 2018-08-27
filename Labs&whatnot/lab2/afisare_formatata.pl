%Author: Pascu Monica-Nicoleta CTI351
%Date: 02/03/2018

afis([H|T]):- afis_daca_impar(H), afis(T), afis_daca_par(H).
afis([]):- nl.

afis_daca_par(Nr):- Nr mod 2 =:= 0, write(Nr).
afis_daca_par(_).

afis_daca_impar(Nr):- Nr mod 2 =:= 1, write(Nr).
afis_daca_impar(_).

/*
| ?- afis([9,7,6,8,2,1,0]).
971
0286
yes
| ?- 
*/

