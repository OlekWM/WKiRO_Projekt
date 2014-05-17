function [ samples ] = proteins2Samples( proteins, wndSize )
% Tworzy próbki z listy bia³ek i ich drugorzêdowych struktur o zadanym
% rozmiarze okna

protCount = length(proteins);

samples = [];
for i = 1 : protCount
    protein = cell2mat(proteins{i}(1));
    % Zamieniamy myœlnik na C
    struct = fixSecondLvlStruct(cell2mat(proteins{i}(2)));
    newSamples = createSamples(protein, struct, wndSize);
    samples = [ samples; newSamples ];
end
end

