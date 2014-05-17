function [ samples ] = proteins2Samples( proteins, wndSize )
% Tworzy pr�bki z listy bia�ek i ich drugorz�dowych struktur o zadanym
% rozmiarze okna

protCount = length(proteins);

samples = [];
for i = 1 : protCount
    protein = cell2mat(proteins{i}(1));
    % Zamieniamy my�lnik na C
    struct = fixSecondLvlStruct(cell2mat(proteins{i}(2)));
    newSamples = createSamples(protein, struct, wndSize);
    samples = [ samples; newSamples ];
end
end

