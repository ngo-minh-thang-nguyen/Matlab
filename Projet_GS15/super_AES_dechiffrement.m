function [ State_dechiffre ]=super_AES_dechiffrement(nb_char, choix_imp)
fprintf('*******************Dechiffrement-AES*******************\n');

nbreHexDansMot=5;

if choix_imp=='1'
    Nk=4;
    Nr=10;
elseif choix_imp=='2'
    Nk=6;
    Nr=12;
elseif choix_imp=='3'
    Nk=8;
    Nr=14;
end

% Lecture du texte chiffre a partir du fichier chiffrer.txt
[ State_chiffre_blocs ] = lecture_texte_chiffre(choix_imp, Nk);
roundKeys=KeyExpansion(Nk, Nr);

fid = fopen('./dechiffrer.txt', 'w');

for i=1:size(State_chiffre_blocs,2)/(4*Nk)
    State_chiffre=State_chiffre_blocs(:,(i-1)*4*Nk+1:i*4*Nk);
    State_dechiffre=AddRoundKey(State_chiffre,RoundKeys(roundKeys,Nr,nbreHexDansMot,Nk),choix_imp);

    r=Nr-1;
    while r>0
        State_dechiffre=InvShiftRows(State_dechiffre,choix_imp);
        State_dechiffre=InvSubBytes(State_dechiffre);
        State_dechiffre=AddRoundKey(State_dechiffre,RoundKeys(roundKeys,r,nbreHexDansMot,Nk),choix_imp);
        State_dechiffre=InvMixColumns(State_dechiffre,Nk);
        r=r-1;
    end
    State_dechiffre=InvShiftRows(State_dechiffre,choix_imp);
    State_dechiffre=InvSubBytes(State_dechiffre);
    State_dechiffre=AddRoundKey(State_dechiffre,RoundKeys(roundKeys,r,nbreHexDansMot,Nk),choix_imp);
    
    if i==size(State_chiffre_blocs,2)/(4*Nk)
        State_dechiffre=ecriture_texte_sortie(nb_char, State_dechiffre, choix_imp);
    else
        State_dechiffre=ecriture_texte_sortie(0, State_dechiffre, choix_imp);
    end
    fwrite(fid,State_dechiffre);
end

return,

function [sous_cle]=RoundKeys(roundKeys,i,nbreHexDansMot,Nk)
    sous_cle=reshape(roundKeys(Nk*nbreHexDansMot*i+1:Nk*nbreHexDansMot*(i+1)),nbreHexDansMot,[]);
return,

