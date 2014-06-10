function [ training, validation, test ] = splitSamples( samples, proportions )
% Dzieli zbiór próbek na podzbiory treningowy, walidacyjny oraz testowy w
% odpowiednich proporcjach.
%
% proportions - wektor 3 liczb - proporcje treningowy:walidacyjny:testowy

sampCount = size(samples, 1);

sumProportions = sum(proportions);
trainingCount = ceil((proportions(1) / sumProportions) * sampCount);
validationCount = ceil((proportions(2) / sumProportions) * sampCount);

training = samples(1 : trainingCount, :);
validation = samples(trainingCount + 1 : trainingCount + validationCount, :);
test = samples(trainingCount + validationCount + 1 : end, :);
end

