%Author: Pascu Monica-Nicoleta CTI351
%Date: 02/04/2018

citire_fis(F):-open(F,read,Stream),repeat, get_char(Stream,X),write(X), at_end_of_stream(Stream),!,close(Stream).

citire_linii(F):-open(F,read,Stream), repeat,write('linie:'),citeste_linie(Stream),nl,at_end_of_stream(Stream),!,close(Stream).
citeste_linie(Stream):-repeat, get_char(Stream,X),write(X), at_end_of_line(Stream),!.
