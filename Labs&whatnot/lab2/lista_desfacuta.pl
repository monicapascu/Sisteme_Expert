%Author: Pascu Monica-Nicoleta 351
%Date: 26/02/2018

desparte1(L,H,T) :- [H|T]=L.
desparte2(L,H1,H2,T) :- [H1,H2|T]=L.
desparte2el(L,H2) :- desparte1(L,_,T),desparte1(T,H2,_).
desparte2el_b(L,H2) :- desparte2(L,_,H2,_).