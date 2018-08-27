%a
zabrele(N,M):- integer(N),integer(M),N>5,M>3, Ninter is N-2, DimM is N+M+2, linie_continua(DimM), desen_zabrele(Ninter,M),linie_continua(DimM).
desen_zabrele(N,M):- N>0, N1 is N-1, zabrele_linie(M),desen_zabrele(N1,M).
desen_zabrele(0,_).

zabrele_linie(M):-M>1, M1 is M-1, write('#'), write(' '), zabrele_linie(M1).
zabrele_linie(1):-write('#'),nl.

linie_continua(M):-M>0, M1 is M-1, write('#'), linie_continua(M1).
linie_continua(0):-nl.

/*
| ?- zabrele(6,8). 
################
# # # # # # # #
# # # # # # # #
# # # # # # # #
# # # # # # # #
################
yes
| ?- 
*/

%b

%c

 matrice(m4,
    [[11,10,7,3],
    [8,100,1,4],
    [9,9,10,11]]
).


matrice(m7,
    [[12,10,74,3],
    [9,100,1,22],
    [9,8,10,121]]
).

intersectie_matrici_nume(Nume1,Nume2,MRez):-matrice(Nume1,M1),matrice(Nume2,M2),intersectie_matrici(M1,M2,MRez).
intersectie_matrici([Linie1|M1],[Linie2|M2],[LinieRez|MRez]):-intersectie_linii(Linie1,Linie2,LinieRez),intersectie_matrici(M1,M2,MRez).
intersectie_matrici([],[],[]).


intersectie_linii([H1|T1],[H2|T2],[HRez|TRez]):- (H1==H2 -> HRez = H1; HRez = 0), intersectie_linii(T1,T2,TRez).
intersectie_linii([],[],[]).

/*
| ?- intersectie_matrici_nume(m4,m7,M).              
M = [[0,10,0,3],[0,100,1,0],[9,0,10,0]] ? ;
no
*/

%d

inloc_elem(Poz1,Poz2,Ldata,Linsert,Lnou):-
length(Ldata, Lgtot), 
length(L1,Poz1),
 Lg2 is Lgtot-Poz2, 
 length(L2,Lg2), 
 append(L1,Laux,Ldata),
 append(_,L2,Laux),
 append(L1,Linsert,Laux2),
 append(Laux2,L2,Lnou).
 
 /*
 | ?- inloc_elem(2,5,[a,b,c,d,e,f,g,h,i,j],[0,1,2,3,4,5],L).
L = [a,b,0,1,2,3,4,5,f,g|...] ? <100
L = [a,b,0,1,2,3,4,5,f,g,h,i,j] ? ;
no
*/
