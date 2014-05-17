function [ output ] = protein2FeatureVector( protein )
% Konwertuje bia³ko (ci¹g aminokwasów) na wektor cech.

len = length(protein);

for i = 1 : len
    result(i) = amino2Feature(protein(i));
end

output = result;
end

