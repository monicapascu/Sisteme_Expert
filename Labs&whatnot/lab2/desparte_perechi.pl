%Author: Pascu Monica-Nicoleta 351
%Date: 26/02/2018

desparte_perechi(E1,_,[E1]).
desparte_perechi(E1,E2,[E1,E2|_]).
desparte_perechi(E1,E2,[_,_|T]) :- desparte_perechi(E1,E2,T).

%b)

desparte_perechi_i(E1,E2,[_,_|T]) :- desparte_perechi(E1,E2,T).
desparte_perechi_i(E1,_,[E1]).
desparte_perechi_i(E1,E2,[E1,E2|_]).

