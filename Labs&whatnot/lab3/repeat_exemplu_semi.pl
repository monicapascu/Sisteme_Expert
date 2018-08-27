%Author: Pascu Monica-Nicoleta CTI351
%Date: 21/04/2018

 :-dynamic p/1.

p(a).
p(b).
p(c).
p(d).

afiseaza_tot2:-repeat, \+ (p(X),retract(p(X)), write(X),get_char(_),listing(p),get_char(_)),!.

/*
| ?- afiseaza_tot2.
a
p(b).
p(c).
p(d).

|: 
b
p(c).
p(d).

|: 
c
p(d).

|: 
d
|: 
yes
*/