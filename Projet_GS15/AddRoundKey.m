function [ matrice_hexa_arrange ] = AddRoundKey(State,sous_cle,choix_imp)

nbreDeBits=16;
nbreHexDansMot=5;

% Transformer matrice hexa en matrice decimal
for i=1:size(State,1)
    for j=1:(size(State,2)/4)
        element_hexa=State(i,4*j-3:4*j);
        element_dec=hex2dec(element_hexa);
        
        State_dec(i,j)=element_dec;
    end
end

State_dec=uint8(dec2bin(reshape(State_dec,1,[]),nbreDeBits))-48;
sous_cle=uint8(dec2bin(reshape(sous_cle,1,[]),nbreDeBits))-48;

matrice_dec=reshape(bin2dec(num2str(double(xor(State_dec,sous_cle)))),nbreHexDansMot,[]);
matrice_hexa=dec2hex(matrice_dec,4);

if choix_imp=='1'
    matrice_arrange=[1 21 41 61 6 26 46 66 11 31 51 71 16 36 56 76;
                     2 22 42 62 7 27 47 67 12 32 52 72 17 37 57 77;
                     3 23 43 63 8 28 48 68 13 33 53 73 18 38 58 78;
                     4 24 44 64 9 29 49 69 14 34 54 74 19 39 59 79;
                     5 25 45 65 10 30 50 70 15 35 55 75 20 40 60 80];
elseif choix_imp=='2'
    matrice_arrange=[1 31 61 91 6 36 66 96 11 41 71 101 16 46 76 106 21 51 81 111 26 56 86 116;
                     2 32 62 92 7 37 67 97 12 42 72 102 17 47 77 107 22 52 82 112 27 57 87 117;
                     3 33 63 93 8 38 68 98 13 43 73 103 18 48 78 108 23 53 83 113 28 58 88 118;
                     4 34 64 94 9 39 69 99 14 44 74 104 19 49 79 109 24 54 84 114 29 59 89 119;
                   5 35 65 95 10 40 70 100 15 45 75 105 20 50 80 110 25 55 85 115 30 60 90 120];
elseif choix_imp=='3'
    matrice_arrange=[1 41 81 121 6 46 86 126 11 51 91 131 16 56 96 136 21 61 101 141 26 66 106 146 31 71 111 151 36 76 116 156;
                     2 42 82 122 7 47 87 127 12 52 92 132 17 57 97 137 22 62 102 142 27 67 107 147 32 72 112 152 37 77 117 157;
                     3 43 83 123 8 48 88 128 13 53 93 133 18 58 98 138 23 63 103 143 28 68 108 148 33 73 113 153 38 78 118 158;
                     4 44 84 124 9 49 89 129 14 54 94 134 19 59 99 139 24 64 104 144 29 69 109 149 34 74 114 154 39 79 119 159;
                   5 45 85 125 10 50 90 130 15 55 95 135 20 60 100 140 25 65 105 145 30 70 110 150 35 75 115 155 40 80 120 160];
end
matrice_hexa_arrange=matrice_hexa(matrice_arrange);

return,

