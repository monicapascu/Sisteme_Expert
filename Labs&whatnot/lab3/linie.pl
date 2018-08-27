
patrat(N,Max,Mat) :- linii(N,N,Max,Mat).

linii(Lin,Col,Max,[]):-
  Lin =:= 0,
  !.
  
linii(Lin,Col,Max,[LH|LT]) :-
  Lin > 0,
  N is Lin * Col,
  createList(N,Col,Max,LH),
  Lin2 is Lin-1,
  linii(Lin2,Col,Max,LT).
  
  
createList(Nr,Col,Max,[]):-
    Col =:= 0,
	!.
createList(Nr,Col,Max,[L|Rest]):-
   Nr > Max , Nr2 is 0,
   Nr =< Max , Nr2 is Nr -1 ,
   Col2 is Col -1 ,
    createList(Nr2,Col2,Max,Rest).
	
    
   
   
     