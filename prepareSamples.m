function [train, test] = prepareSamples(samples, classFunc, splitRatio)
% Funkcja dokonuje przekszta³cenia na klasy binarne oraz podzia³u na zbiór
% testowy i treningowy.

% Konwersja klas aminokwasow na klasy binarne
binarySamples = createBinarySamples(samples, classFunc);

% Wymieszanie probek przed podzia³em
binarySamples = shuffleSamples(binarySamples);

% Podzia³ na zbiór treningowy i testowy
[train, test] = splitSamples(binarySamples, splitRatio);
end