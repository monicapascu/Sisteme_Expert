%Author: Pascu Monica-Nicoleta 351
%Date: 26/02/2018

listaN1(N,[N|T]) :- N>1, N1 is N-1, listaN1(N1,T).
listaN1(1,[1]).

%b)

lista1N(N,L) :- listaux(N,1,L).
listaux(N,C,[C|T]) :- C<N, C1 is C+1, listaux(N,C1,T).
listaux(N,N,[N]).