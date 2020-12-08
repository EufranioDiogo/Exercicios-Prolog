% a)

progenitor(josé, joão).
progenitor(josé, ana).
progenitor(maria, joão).
progenitor(maria, ana).

progenitor(ana, helena).
progenitor(ana, joana).

progenitor(joão, mário).

progenitor(mário, carlos).
progenitor(helena, carlos).


% b)

sexo(josé, masculino).
sexo(joão, masculino).
sexo(maria, femenino).
sexo(ana, femenino).
sexo(helena, femenino).
sexo(joana, femenino).
sexo(mário, masculino).
sexo(carlos, masculino).

irmã(X, Y) :- progenitor(Z, X), progenitor(Z, Y), sexo(X, femenino), X \== Y.
irmão(X, Y) :- progenitor(Z, X), progenitor(Z, Y), sexo(X, masculino), X \== Y.
filho(X, Y) :- progenitor(Y, X), sexo(X, masculino).
filha(X, Y) :- progenitor(Y, X), sexo(X, femenino).
mãe(X, Y) :- progenitor(X, Y), sexo(X, femenino).
pai(X, Y) :- progenitor(X, Y), sexo(X, masculino).
tio(X, Y) :- progenitor(Z, Y), irmão(X, Z).
tia(X, Y) :- progenitor(Z, Y), irmã(X, Z).
primo(X, Y) :- progenitor(Z, X), tio(Z, Y); tia(Z, Y), sexo(X, masculino), X \== Y.
prima(X, Y) :- progenitor(Z, X), tio(Z, Y); tia(Z, Y), sexo(X, femenino) X \== Y.
avô(X, Y) :- progenitor(Z, Y), progenitor(X, Z), sexo(X, masculino).
avó(X, Y) :- progenitor(Z, Y), progenitor(X, Z), sexo(X, femenino).

descendente(X, Y) :- progenitor(Y, X).
descendente(X, Y) :- progenitor(Z, X), descendente(Z, Y).

ascendente(X, Y) :- progenitor(X, Y).
ascendente(X, Y) :- progenitor(X, Z), ascendente(Z, Y).

% c)
% 1º João é filho de José? R: progenitor(josé, joão).
% 2º Filhos de Maria? R: progenitor(maria, X).
% 3º Quem são os primos do Mário? R: primo(mario, X).
% 4º 
% 5º Quem são os ascendentes de carlos? R: mário, joão, josé, maria, helena, ana.
% 6º A Helena tem irmãos? E irmãs? i 

