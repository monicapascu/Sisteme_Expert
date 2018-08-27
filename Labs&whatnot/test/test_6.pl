%pred(+Director)
:- use_module(library(file_systems)).
:- use_module(library(system)). %datime
pred(Dir):- directory_exists(Dir), 
			file_members_of_directory(Dir, L), 
			datime(X), 
			transforma_sir(X, Sir_Data), 
			atom_concat(Dir, '/', Dir1),
			redenumeste_fisiere(Dir1, L, Sir_Data).
			
transforma_sir(X, Sir_Data):- X =.. [_|Lnr], concat_sir(Lnr, Sir_Data).

concat_sir([H|T], Sir_Data):- concat_sir(T, Sir_DataT), number_chars(H, LH), 
								atom_chars(At, LH), atom_concat(At, '_', Aux), 
								atom_concat(Aux, Sir_DataT, Sir_Data).
concat_sir([H], AtH):- number_chars(H, LH), atom_chars(AtH, LH).

redenumeste_fisiere(Dir, [Fis - _|T], Sir_Data):- atom_chars(Fis, LFis), append(Lnume, ['.'|Lext], LFis), atom_chars(Sir_Data, LData), 
											append(Lnume, LData, Laux), append(Laux, ['.'|Lext], Ltot), atom_chars(NumeNou, Ltot), 
											atom_concat(Dir, NumeNou, DirNume), atom_concat(Dir, Fis, DirFis),
											rename_file(DirFis, DirNume), redenumeste_fisiere(Dir, T, Sir_Data).
redenumeste_fisiere(_, [], _). 