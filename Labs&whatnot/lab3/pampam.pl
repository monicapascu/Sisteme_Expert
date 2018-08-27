make_num_matrix(N, Matrix) :-
    make_matrix(N, N, Matrix),
	add_matrix(Matrix,AddMatrix).

make_matrix(_, N, []) :-
    N =< 0,
    !.
make_matrix(M, N, [R|Rs]) :-
    
    make_list(M, R),
    N2 is N - 1,
    make_matrix(M, N2, Rs).

make_list(N, []) :-
    N =< 0,
    !.
make_list(N, [N|Rest]) :-
    N > 0,
    N2 is N - 1,
    make_list(N2, Rest).
	
add_matrix(M,[LH|LT]):-
    
	

	
	