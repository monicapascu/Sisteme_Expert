%%  transpose(+Matrix, ?Transpose) is det
%
%   Transposes a matrix (squared or rectangular).
%   Uses transpose/3 and first_column/3 with an accumulator.

transpose([A|As], At) :-
    transpose(A, [A|As], At).

%   transpose(+Matrix, +Accumulator, ?Transpose)

transpose([],_,[]).
transpose([_|As], Rest, [At|Ats]) :-
    first_column(Rest, At, NewRest),
    transpose(As, NewRest, Ats).

%   first_column(+Matrix, ?List, ?Rest)

first_column([], [], []).
first_column([[A|As]|Ass], [A|Acc], [As|Rest]) :-
first_column(Ass, Acc, Rest).

% quick_sort2(List,Sorted):-q_sort(List,[],Sorted).
% q_sort([],Acc,Acc).
% q_sort([H|T],Acc,Sorted):-
    % pivoting(H,T,L1,L2),
    % q_sort(L1,Acc,Sorted1),q_sort(L2,[H|Sorted1],Sorted)
	
arrange([],[]).	
arrange([H|T],[LH|LT]):- 
sort(H,LH),
arrange(T,LT).


matr_grav(MatInit, MatFinal):-
    %calculam transpusa
    transpose(MatInit, MatInitTransp),
    %shiftam toate valorile de unu la stanga
    arrange(MatInitTransp, MatInitTranspShift),
    %transpusa transpusei e matricea initiala
    transpose(MatInitTranspShift, MatFinal).
	
matrice_test(mat1, [[0,0,0],[1,1,1],[0,0,0]]).
matrice_test(mat2, [[0,0,0,1,0],[0,0,1,0,0],[1,0,0,0,1],[0,0,0,1,1],[0,0,1,0,0]]).
matrice_test(mat3, [[0,0],[1,0],[0,1],[0,0],[0,1]]).
matrice_test(mat4, [[1,1],[1,1]]).