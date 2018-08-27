% Author: Pascu Monica-Nicoleta 351
% Date: 26-02-2018

%a)
luni(1,ianuarie).
luni(2,februrie).
luni(3,martie).
luni(4,aprilie).
luni(5,mai).
luni(6,iunie).
luni(7,iulie).
luni(8,august).
luni(9,septembrie).
luni(10,octombrie).
luni(11,noiembrie).
luni(12,decembrie).

luna(X,Y):- luni(X,Y).


/*
| ?- luna(X,ianuarie).
X = 1 ? 
yes
| ?- luna(X,noiembrie).
X = 11 ? 
yes
| ?- luna(1,Y).
Y = ianuarie ? 
yes
| ?- 

*/

%b)
nr_zile(ianuarie,31).
nr_zile(februrie,28).
nr_zile(februrie,29).
nr_zile(martie,31).
nr_zile(aprilie,30).
nr_zile(mai,31).
nr_zile(iunie,30).
nr_zile(iulie,31).
nr_zile(august,31).
nr_zile(septembrie,30).
nr_zile(octombrie,31).
nr_zile(noiembrie,30).
nr_zile(decembrie,31).

nr_zile1(X,Y):- nr_zile(X,Y).

/*
| ?- nr_zile1(ianuarie,X).                                           
X = 31 ? 
yes
| ?- nr_zile1(decembrie,X).
X = 31 ? 
yes
| ?- nr_zile1(septembrie,X).
X = 30 ? 
yes
*/


%c)
an_bisect(An):- integer(An), An mod 4 =:= 0, An mod 100 =\= 0.
an_bisect(An):- integer(An), An mod 400 =:= 0.

/*
| ?- an_bisect(2004).
yes
| ?- an_bisect(2005).
no
| ?- an_bisect(2008).
yes
| ?- an_bisect(2010).
no
| ?- 
*/

%d)

data_corecta(X,Y,Z):- ((Y =\=2, Y =< 7, Y mod 2 =\= 0, X =< 31) ; (Y =\=2, Y =< 7, Y mod 2 =:= 0, X =< 30) ; (Y > 7, Y mod 2 =\= 0, X =< 30) ; (Y > 7, Y mod 2 =:= 0, X =< 31) ; (Y =:= 2, (Z mod 400 =:= 0 ; Z mod 4 =:= 0, Z mod 100 =\= 0), X =< 29) ; (Y =:= 2, (Z mod 4 =\= 0 ; Z mod 100 =:= 0, Z mod 400 =\= 0), X =< 28)), (integer(X), integer(Y), integer(Z)).


/*
| ?- data_corecta(29,2,2000).        
yes
| ?- data_corecta(35,4,2008).        
no
| ?- data_corecta(11,1,2010).        
yes
| ?- data_corecta(29,2,1800).
no
| ?- 
*/