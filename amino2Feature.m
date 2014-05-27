function [ output ] = amino2Feature( amino )
% Dla danego aminokwasu zwraca jego wektor cech jako komórkê - HARDCODED.

aminos = 'ILVPFMWACGYTSHQKNEDR';
result = zeros(1, 20);
found = 0;

for i =  1 : 20
    if amino == aminos(i)
        result(i) = 1;
        found = 1;
        break
    end
end

if found == 0
    error('Nieznany aminokwas %s, nie mozna przyporzadkowac cechy.', amino);
end

output = {result};
end