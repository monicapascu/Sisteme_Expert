%paianjen(nume, lista_structuri_insecta)
%structura: insecta(tip, nr_prins_de_painjen) paianjen(spidy,[insecta(musca,5),insecta(fluture, 8)]).
paianjen(ochisori,[insecta(lacusta,7),insecta(fluture, 2), insecta(albina,7), insecta(libelula,5)]).
paianjen(pufy, [insecta(fluture, 5),insecta(lacusta,1), insecta(albina,3)]).
paianjen(zumi, [insecta(musca, 7)]).
paianjen(flamandu, []).
paianjen(buhu, [insecta(musca, 5),insecta(lacusta,1), insecta(albina,3), insecta(libelula,10)]).

%a

paianjen(peterparker, [insecta(musca, 5)]).
afis_paianjen:- paianjen(X,_),write(X),nl,fail; true .

/*
| ?- afis_paianjen.
ochisori
pufy
zumi
flamandu
buhu
peterparker
yes
| ?- 
*/

%b 
sum_lista([H|T],Suma):- sum_lista(T,SumaT),Suma is SumaT+H. 
lista_paianjeni(Ld):- setof(st(Lp,X),Per^ (paianjen(X,Per),length(Per,Lp)),Laux),findall(Y, member(st(_,Y),Laux),Ld).

/*
| ?- lista_paianjeni(L).
L = [flamandu,peterparker,zumi,pufy,buhu,ochisori] ? 
yes
| ?- 
*/

%c
%ins_prefer(+NumeP, -Insecta)


max2([R], R).
max2([X|Xs], R):- max2(Xs, T), X = insecta(NumeX,NrX),T = insecta(NumeT,NrT),( NrX > NrT -> R = X ; R = T).
ins_prefer(N,I):- paianjen(N,L),max2(L,I).

/*
| ?- ins_prefer(buhu,I).
I = insecta(libelula,10) ? ;
no
*/

%d


insecte_listcp(X,LC):- setof(Nume,Y^P^(insecte_aux(P,Nume),P = insecta(X,Y)),LC).
insecte_aux(P,Nume):- paianjen(Nume,LI),member(P,LI).

/*
es
| ?- insecte_listcp(I,P).                             
I = albina,
P = [buhu,ochisori,pufy] ? ;
I = fluture,
P = [ochisori,pufy] ? ;
I = lacusta,
P = [buhu,ochisori,pufy] ? ;
I = libelula,
P = [buhu,ochisori] ? ;
I = musca,
P = [buhu,peterparker,zumi] ? ;
no
*/

%e nu-l fac
