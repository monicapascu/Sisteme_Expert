%Author: Pascu Monica-Nicoleta 351
%Date: 26/02/2018

inverse(L,Li) :- inverse_aux(L,[],Li).
inverse_aux([H|T],Laux,Li) :- inverse_aux(T,[H|Laux],Li).
inverse_aux([],Laux,Li) :- Li = Laux.
