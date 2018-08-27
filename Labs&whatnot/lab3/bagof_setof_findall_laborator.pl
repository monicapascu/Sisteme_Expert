% Author: Pascu Monica-Nicoleta CTI351
% Date: 12/03/2018

copil(ion, [bulbasaur, charmander, rattata, charmander]).
copil(liliana, [rattata, pichu, bulbasaur]).
copil(monica, [pidgey, charmander, caterpie, bulbasaur, machop]).
copil(andrei, [bulbasaur, pichu, bulbasaur, caterpie]).
copil(gogu, [slowpoke, bulbasaur, slowpoke, slowpoke]).
copil(alexandra, [bulbasaur, magnemite]).
copil(marius, [bulbasaur, pidgey]).

%a)
%nr_copii(-Nr).
nr_copii(N):- findall(Nume,copil(Nume,_),L), length(L,N).

/*
| ?- nr_copii(N).
N = 7 ? 
yes
*/

%b)
%list_pokemoni(-Lpokem)
list_pokemoni(L):- setof(P,Lp^Nume^(copil(Nume,Lp),member(P,Lp)),L).

/*
| ?- list_pokemoni(L).                             
L = [bulbasaur,caterpie,charmander,machop,magnemite,pichu,pidgey,rattata,slowpoke] ? 
yes
*/

%c)
%list_nume(-Initiala,-ListaNume)
list_nume(I,LN):- setof(Nume, T^LC^Lp^(copil(Nume,Lp),atom_chars(Nume,LC),LC = [I|T]),LN).

/*
| ?- list_nume(a,LN).
LN = [alexandra,andrei] ? ;
no
| ?- list_nume(g,LN).
LN = [gogu] ? 
yes
| ?- list_nume(I,LN).
I = a,
LN = [alexandra,andrei] ? ;
I = l,
LN = [liliana] ? ;
I = m,
LN = [marius,monica] ? ;
no
*/

%d)
%pokemon_listcp(-NumePokemon, -ListaCopii).
pokemon_listcp(P,LC):- setof(Nume,poke_aux(P,Nume),LC).
poke_aux(P,Nume):- copil(Nume,LP),member(P,LP).

/*
| ?- pokemon_listcp(X,LP).      
X = bulbasaur,
LP = [alexandra,andrei,gogu,ion,liliana,marius,monica] ? ;
X = caterpie,
LP = [andrei,monica] ? ;
X = charmander,
LP = [ion,monica] ? ;
X = machop,
LP = [monica] ? ;
X = magnemite,
LP = [alexandra] ? ;
X = pichu,
LP = [andrei,liliana] ? ;
X = pidgey,
LP = [marius,monica] ? ;
X = rattata,
LP = [ion,liliana] ? ;
X = slowpoke,
LP = [gogu] ? ;
no
*/

%e)
%nume_cp_max(-NumeCopil).
nume_cp_max(NumeMax):- setof(st(Nrp,Nume),LP^(copil(Nume,LP),length(LP,Nrp)),L),write(L),ult(L,E),E = st(_,NumeMax).
ult([E],E):- !.
ult([_|T],E):- ult(T,E).

/*
| ?- nume_cp_max(R).                                      
[st(2,alexandra),st(2,marius),st(3,liliana),st(4,andrei),st(4,gogu),st(4,ion),st(5,monica)]
R = monica ? ;
no
*/

%f)
%nume_nr_poke_max(-Numecopil)
nume_nr_poke_max(NumeMax):- setof(st(Nrp,P,Nume),nrp_aux(Nrp,P,Nume),L),L = [st(,,NumeMax)|_].
nrp_aux(Nrp,P,Nume):- copil(Nume,LP),member(P,LP),count(P,LP,Nrp1),Nrp is -Nrp1.
count(P,[H|T],Nr):- count(P,T,NrT),(H==P,!,Nr is NrT+1;Nr=NrT).
count(_,[],0).

/*
| ?- nume_nr_poke_max(N).                                 
N = gogu ? ;
no
*/

%g)
%l_per_copii(-Lista).
per_copii(Nume1,Nume2):- copil(Nume1,LP1),copil(Nume2,LP2),Nume1@<Nume2,member(X,LP1),member(X,LP2),member(Y,LP1),X\==Y,member(Y,LP2).
l_per_copii(L):- setof([Nume1,Nume2],per_copii(Nume1,Nume2),L). 

/*
| ?- l_per_copii(R).                                      
R = [[andrei,liliana],[andrei,monica],[ion,liliana],[ion,monica],[marius,monica]] ? ;
no
*/

%h)
%l_det(-Lista).
l_det(L):- setof(detine(Nume,P),LC^(pokemon_listcp(P,LC),LC=[Nume]),L).