%Author: Pascu Monica-Nicoleta CTI351
%Date: 02/03/2018

patr_perf(N):- RadN is round(sqrt(N)), abs(RadN*RadN - N) < 0.0001.

numara_pp([H|T],N):- numara_pp(T,NT), (patr_perf(H), !, N is NT + 1; N = NT).
numara_pp([],0).

/*
| ?- numara_pp([1,2,3,4,5,6],N).                                
N = 2 ? 
yes
| ?- numara_pp([1,2,3,4,5,6,7,8,9],N).
N = 3 ? 
yes
| ?- 
*/
