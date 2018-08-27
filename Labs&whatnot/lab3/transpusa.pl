
% Author: Pascu Monica-Nicoleta CTI351
% Date: 14/04/2018

%------PART1------
transpose([A|As], At) :-
    transpose(A, [A|As], At).

%   transpose(+Matrix, -Accumulator, -Transpose)

transpose([], _, []).
transpose([_|As], Rest, [At|Ats]) :-
    first_column(Rest, At, NewRest),
    transpose(As, NewRest, Ats).

%   first_column(+Matrix, -List, -Rest)

first_column([], [], []).
first_column([[A|As]|Ass], [A|Acc], [As|Rest]) :-
first_column(Ass, Acc, Rest).

matrice(m1, [[1,2],[3,4],[5,6]]).
matrice(m2, [[1],[2],[3]]).

/*
| ?- matrice(_, M), transpose(M, T).                   
M = [[1,2],[3,4],[5,6]],
T = [[1,3,5],[2,4,6]] ? ;
M = [[1],[2],[3]],
T = [[1,2,3]] ? ;
no
*/

%------PART2------

%	first_column2(+Matrix, -List, -Rest)

first_column2([], [], []).
first_column2([H | TRest], [AH | ATRest], [LH| LTRest]):-
    [Elem | LH] = H ,
    Elem =.. [_ | [AH]],
    first_column2(TRest, ATRest, LTRest).

%	transpose2(+Matrix, -Transpose)	
transpose2([[] | _], []):- !.
transpose2(Mat, [HTransp | TTransp]):-
    first_column2(Mat, HTransp, Rest),
    transpose2(Rest, TTransp).
	
/*
| ?- transpose2([[a(1),x(2)],[b(3),t(4)],[a(5),b(6)]], T).
T = [[1,3,5],[2,4,6]] ? ;
no
| ?- 
*/


