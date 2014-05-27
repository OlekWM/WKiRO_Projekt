function [train, test] = prepareSamples(samples, classFunc, splitRatio)
% Funkcja dokonuje przekszta�cenia na klasy binarne oraz podzia�u na zbi�r
% testowy i treningowy.

% Konwersja klas aminokwasow na klasy binarne
binarySamples = createBinarySamples(samples, classFunc);

% Wymieszanie probek przed podzia�em
binarySamples = shuffleSamples(binarySamples);

% Podzia� na zbi�r treningowy i testowy
[train, test] = splitSamples(binarySamples, splitRatio);
end