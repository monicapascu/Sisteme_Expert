%Author: Pascu Monica-Nicoleta 351
%Date: 26/02/2018

adancime(X,0) :- atomic(X).
adancime([H|T],A) :- adancime(H,AH), adancime(T,AT), AH1 is AH+1, max2(AH1,AT,A).
adancime([],1).