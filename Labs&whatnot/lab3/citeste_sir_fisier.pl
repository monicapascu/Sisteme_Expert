separatori([' ','\t','\n']).
/*observati ca separatorii sunt dati ca termeni, nu ca siruri.
Aici am pus doar caractere blank, dar putem pune orice termen de un caracter,
de exemplu putem adauga si termenul 'a' la lista, si atunci daca avem in fisier 12amiauabb
prin aplicarea repetata a lui citeste_sir obtinem sirurile 12,mi,u,bb
*/
membru(X,[X|_]).
membru(X,[_|T]):-membru(X,T).

citire_fis_sir(F):-open(F,read,Stream),separatori(L_Separ),repeat, citeste_sir(Stream,L_Separ,S),atom_codes(Termen,S),write(Termen),nl,at_end_of_stream(Stream),!,close(Stream).

citeste_sir(Stream,LS,Sir) :- get_char(Stream,X),
    ((X==end_of_file;membru(X,LS))-> Sir=[] 
	%end_of_file nu l-am pus in lista de separatori deoarece oricum apare o singura data, la sfarsit de fisier (altfel ar fi consumat timp fiind si el testat la citirea fiecarui caracter, fiindca se parcurge toata lista de separatori)
         ;(
         name(X,[X1]),
         citeste_sir(Stream, LS,Sir1),
         Sir=[X1|Sir1])
         ).

% urmatorul set de predicate face acelasi lucru ca si predicatele de mai sus, dar lucreaza direct cu siruri de caractere, nu cu termeni.
separatori2(" \t\n").

citire_fis_sir2(F):-open(F,read,Stream),separatori2(L_Separ),repeat, citeste_sir2(Stream,L_Separ,S),atom_codes(Termen,S),write(Termen),nl,at_end_of_stream(Stream),!,close(Stream).

%citeste sir2 face acelasi lucru ca si citeste_sir
citeste_sir2(Stream,LS,Sir) :- get_code(Stream,X),
    ((X =:= -1;membru(X,LS))-> Sir=[]
	%-1 e codul pentru end_of_file
         ;(
         citeste_sir2(Stream, LS,Sir1),
         Sir=[X|Sir1])
         ).