%Author: Pascu Monica-Nicoleta CTI351
%Date: 02/03/2018

sterge_nr([H|T],Lrez):- (atom(H), !, Lrez = [H|Trez]; Lrez=Trez), sterge_nr(T,Trez).
sterge_nr([],[]).

/*
| ?- sterge_nr([1,2,3,334,21],L).
L = [] ? 
yes
| ?- sterge_nr([1,2,3,334,21,lalala],L).
L = [lalala] ? 
yes
| ?- 
*/