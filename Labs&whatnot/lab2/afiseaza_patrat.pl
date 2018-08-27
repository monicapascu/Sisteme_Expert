%Author: Pascu Monica-Nicoleta 351
%Date: 26/02/2018

linie(0,_) :-
  nl
  .

linie(N,C) :-
  N > 0 ,
  write(C) ,
  N1 is N-1 ,
  linie(N1,C)
  .
  
linii(0,_,_) :- 
  nl
  .
  
linii(M,N,C) :-
  M > 0 ,
  linie(N,C) ,
  M1 is M-1 ,
  linii(M1,N,C)
  .
  
patrat(N,Chr) :- linii(N,N,Chr).



