%Author: Pascu Monica-Nicoleta CTI351
%Date: 18/04/2018

%sum_mat(+Matrix, +Matrix, -Matrix)
sum_mat([], [], []).
sum_mat([M1|M1T], [M2|M2T], [M3|M3T]) :-
    sum_vector(M1, M2, M3),
    sum_mat(M1T, M2T, M3T).

%sum_vector(+List, +List, -List) 

sum_vector([], [], []).
sum_vector([M1|M1T], [M2|M2T], [M3|M3T]) :-
    M3 is M1 + M2,
sum_vector(M1T, M2T, M3T).

/*
| ?- sum_mat([[1,1,1],[2,2,2],[3,3,3]],[[1,1,1],[2,2,2],[3,3,3]],M3).          M3 = [[2,2,2],[4,4,4],[6,6,6]] ? ;
no
*/