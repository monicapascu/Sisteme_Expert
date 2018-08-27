weapon(scissors).
weapon(rock).
weapon(paper).

over(scissors, paper).	
over(rock,scissors).
over(paper,rock).

isOver(X, Y) :-
	weapon(X), 
	weapon(Y),
	over(X,Y).

wins(X, X, draw) :-	weapon(X).
wins(X, Y, X) :- isOver(X, Y).
wins(X, Y, Y) :- isOver(Y, X).

game(X, Y) :-
	wins(X,Y,Sol), 
	Sol \= draw,
	nl, write(Sol), write(' wins'), nl, !.
	
game(X, Y) :-
	wins(X,Y,draw), 
nl, write('There is a draw!'), nl, !.

/*
| ?- game(rock,paper).

paper wins
yes
*/

