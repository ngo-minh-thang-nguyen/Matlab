function [res]=TestIrreductibilite(polynome)
% Ce script nous permet de verifier l'irreductibilite de un polynome
% dans le corps GF2^16. Ce script est base sur le test d'irreductibilite
% de Rabin. En effet, ce theoreme est divise en 2 conditions

nbreDeBits=16;
arrayRes=csvread('ArrayRes.csv');

% La premiere condition: P divise X^(m^p)-X avec m=2 et p=16 et P = X16 + X5
% + X3 + X2 + 1.
m=2; p=16;
% Trouver le diviseur dans cette division
diviseur=Inverse(dec2bin(polynome,nbreDeBits), arrayRes, nbreDeBits);
% Trouver le dividence dans cette division
dividence=zeros(1,2^16+1);
dividence(1,1)=1;
dividence(1,2^16)=1;

class(dividence)

res=1;
    

return,


