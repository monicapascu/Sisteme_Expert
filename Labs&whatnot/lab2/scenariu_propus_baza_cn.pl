%Author: Pascu Monica-Nicoleta 351
%Date: 25/02/2018

diploma(0,8,diploma_de_participare).
diploma(8,9.5,diploma_mentiune).
diploma(9.5,10,diploma_premiu).

tricou(fizica,_,albastru).
tricou(astronomie,_,albastru).
tricou(matematica,_,albastru).
tricou(literatura,_,rosu).
tricou(arta_moderna,_,rosu).
tricou(gimnastica,9,gri).
tricou(gimnastica,10,alb).
tricou(alergari,9,gri).
tricou(alergari,10,alb).

premiu(astronomie,diploma_premiu,60,excursie_NASA).
premiu(fizica,diploma_premiu,_,telescop).
premiu(matematica,diploma_premiu,_,telescop).
premiu(literatura,diploma_premiu,_,enciclopedii).
premiu(arta_moderna,diploma_premiu,_,enciclopedii).
premiu(arta_moderna,diploma_mentiune,_,album).
premiu(literatura,diploma_mentiune,_,abonament_biblioteca).
premiu(literatura,diploma_mentiune,_,excursie_Disneyland).
premiu(arta_moderna,diploma_mentiune,_,excursie_Disneyland).
premiu(gimnastica,diploma_mentiune,_,excursie_Disneyland).
premiu(alergari,diploma_mentiune,_,excursie_Disneyland).
premiu(matematica,diploma_de_participare,_,culegere).
premiu(astronomie,diploma_de_participare,_,culegere).
premiu(gimnastica,diploma_premiu,_,echipament).
premiu(alergari,diploma_premiu,_,echipament).


pred_premiu(Domeniu, Punctaj, Timp, Diploma, Tricou, Premiu) :- diploma(P1,P2,Diploma), P1 =< Punctaj, Punctaj < P2, 
tricou(Domeniu,P3,Tricou), Punctaj < P3, premiu(Domeniu,Diploma,Timp,Premiu), Timp =< 60 .  