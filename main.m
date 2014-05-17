function [ output ] = main( filename, wndSize )
% Testowa g³ówna funkcja, parametry wyjœciowe testowo ustalane, ¿eby
% zobaczyæ na aktualny etapie projektu

% Wczytanie bia³ek z pliku
proteins = loadProteins(filename);

% Utworzenie próbek o zadanym rozmiarze okna (próbka -> klasa)
samples = proteins2Samples(proteins, wndSize);

% Utworzenie zbiorów próbek klas binarnych
sampCnotC = createBinarySamples(samples, @class2CnotC);
sampHnotH = createBinarySamples(samples, @class2HnotH);
sampEnotE = createBinarySamples(samples, @class2EnotE);
sampCH = createBinarySamples(samples, @class2CH);
sampCE = createBinarySamples(samples, @class2CE);
sampHE = createBinarySamples(samples, @class2HE);

% Losowa kolejnoœæ próbek
sampCnotC = shuffleSamples(sampCnotC);
sampHnotH = shuffleSamples(sampHnotH);
sampEnotE = shuffleSamples(sampEnotE);
sampCH = shuffleSamples(sampCH);
sampCE = shuffleSamples(sampCE);
sampHE = shuffleSamples(sampHE);

% Podzia³ na zbiory testowe i treningowe (dodaæ póŸniej tak¿e walidacyjny)
[ sampCnotCTrain sampCnotCTest ] = splitSamples(sampCnotC, 0.7);
%...

% Utworzenie klasyfikatorów SVM

% 

output = sampCnotCTrain;
end

