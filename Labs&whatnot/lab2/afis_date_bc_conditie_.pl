%Author: Pascu Monica-Nicoleta 351
%Date: 26/02/2018

soarece('Chit').
soarece('Rontz').
soarece('Cascaval-Finder').
pisica('Miau').
pisica('Madeleine Gherutzescu').
pisica('Motanovski').

%afisSoarecPisic(+Litera)
afisSoarecPisic(L) :- member(L,soarece(X)), write(soarece(X)), member(L,pisica(Y)), write(pisica(Y)).