function [ output ] = protein2FeatureVector( protein )
% Konwertuje bia�ko (ci�g aminokwas�w) na wektor cech.

len = length(protein);

for i = 1 : len
    result(i) = amino2Feature(protein(i));
end

output = result;
end

