% Exercitiu 2 model test
 %dans(nume_dans, lista_perechi)
%lista perechi: [ [nume_baiat, nume_fata], .....]
dans(tango,[[ion, andreea],[marin, ana],[doru, elena]]).
dans(vals,[[mihai, elena],[ion, oana],[daniel, carmen], [doru, andreea], [marin, ana]]).
dans(quickstep, [[ion, andreea],[marin,carmen]]).
dans(jive,[[marin, ana], [doru, elena],[daniel, oana],[ion, andreea]]).
dans(pasodoble,[[marin, elena]]).
dans(vals_vienez,[[daniel, carmen],[doru,oana]]). 

%a
dans(bachata,[[ion,maria],[mihai,ana]]).
afis_dansuri:- dans(X,_),write(X),nl,fail; true .
/*
tango
vals
quickstep
jive
pasodoble
vals_vienez
bachata
yes
*/
%b 
lista_dansuri(Ld):- setof(st(Lp,X),Per^ (dans(X,Per),length(Per,Lp)),Laux),findall(Y, member(st(_,Y),Laux),Ld).
/*
L = [pasodoble,bachata,quickstep,vals_vienez,tango,jive,vals] ? 
*/
%c
dansatori(Nume,LDans):- setof(Dans, dansator_dans(Nume,Dans),LDans).
dansator_dans(Nume,Dans):-dans(Dans,Lper),member(Per,Lper),(Per = [Nume,_]; Per =[_,Nume]).
cmmd(NumeMax):- setof(st(Nr,Nume),LDans^ (dansator(Nume,LDans),length(LDans,Nr)),Laux), ultim(Laux,E),E=st(_,NumeMax).
ultim([E],E):- !.
ultim([_|T], E):- ultim(T, E).
/*
D = [bachata,jive,tango,vals],
L = ana ? ;
D = [jive,quickstep,tango,vals],
L = andreea ? ;
D = [quickstep,vals,vals_vienez],
L = carmen ? ;
D = [jive,vals,vals_vienez],
L = daniel ? ;
D = [jive,tango,vals,vals_vienez],
L = doru ? ;
D = [jive,pasodoble,tango,vals],
L = elena ? ;
D = [bachata,jive,quickstep,tango,vals],
L = ion ? ;
D = [bachata],
L = maria ? ;
D = [jive,pasodoble,quickstep,tango,vals],
L = marin ? ;
D = [bachata,vals],
L = mihai ? ;
D = [jive,vals,vals_vienez],
L = oana ?
*/
%d
dans_fete(NumeB,Lf):- setof(NumeF, pereche(NumeB,NumeF) ,Lf).
pereche(NumeB,NumeF):-dans(_,Lper),member(Per,Lper),Per=[NumeB,NumeF].
/*
L = [carmen,oana],
N = daniel ? ;
L = [andreea,elena,oana],
N = doru ? ;
L = [andreea,maria,oana],
N = ion ? ;
L = [ana,carmen,elena],
N = marin ? ;
L = [ana,elena],
N = mihai ? ;
*/
%e
lista_baieti(LB):- setof(NumeB, baiat(NumeB), LB).
baiat(NumeB):- dans(_,Lper), member([NumeB|_],Lper).
lista_fete(LF):- setof((NumeF),fata(NumeF),LF).
fata(NumeF):- dans(_,Lper), member([_|NumeF],Lper).

pred_matrice(LB,LF,M):- lista_baieti(LB), lista_fete(LF), genereaza_matrice(LB,LF,M).
genereaza_matrice([B|LB],LF,[Linie|M]):- genereaza_linie(B,LF,Linie),genereaza_matrice(LB,LF,M).
genereaza_matrice([],_,[]).
genereaza_linie(B,[F|LF],[Nr|Linie]):- nr_dansuri(B,F,Nr),genereaza_linie(B,LF,Linie).
genereaza_linie(_,[],[]).
nr_dansuri(B,F,Nr):- findall(Dans,(dans(Dans,Lper),member([B,F],Lper)),LDans),length(LDans,Nr).
