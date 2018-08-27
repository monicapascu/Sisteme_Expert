%Author: Pascu Monica-Nicoleta CTI351
%Date: 21/04/2018

p(a).
p(b).
p(c).
p(d).

afiseaza_tot:-repeat, p(X), write(X),get_char(_),!.
afiseaza_tot1:-repeat, \+ (p(X), write(X),get_char(_)),!.
afis:- p(X),write(X),get_char(_), fail;true.

/*
| ?- afis.
a
b
c
d
yes
*/