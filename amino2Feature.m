function [ output ] = amino2Feature( amino )
% Dla danego aminokwasu zwraca jego wektor cech jako komórkê - HARDCODED.

aminos = 'ARNDCQEGHILKMFPSTWYV';
hydroValues = [1.8 -4 -3.5 -3.5 2.5 -3.5 -3.5 0.4 -3.2 4.5 3.8 -3.9 1.9 2.8 -1.6 -0.8 -0.7 -0.9 -1.3 4.2];
found = 0;

for i =  1 : 20
    if amino == aminos(i)
        result = hydroValues(i);
        found = 1;
        break
    end
end

if found == 0
    error('Nieznany aminokwas %s, nie mozna przyporzadkowac cechy.', amino);
end

output = result;
end