function [ output ] = main( filename, wndSize )
% Testowa g��wna funkcja, parametry wyj�ciowe testowo ustalane, �eby
% zobaczy� na aktualny etapie projektu

% Wczytanie bia�ek z pliku
proteins = loadProteins(filename);

% Utworzenie pr�bek o zadanym rozmiarze okna (pr�bka -> klasa)
samples = proteins2Samples(proteins, wndSize);

% Utworzenie zbior�w pr�bek klas binarnych
sampCnotC = createBinarySamples(samples, @class2CnotC);
sampHnotH = createBinarySamples(samples, @class2HnotH);
sampEnotE = createBinarySamples(samples, @class2EnotE);
sampCH = createBinarySamples(samples, @class2CH);
sampCE = createBinarySamples(samples, @class2CE);
sampHE = createBinarySamples(samples, @class2HE);

% Losowa kolejno�� pr�bek
sampCnotC = shuffleSamples(sampCnotC);
sampHnotH = shuffleSamples(sampHnotH);
sampEnotE = shuffleSamples(sampEnotE);
sampCH = shuffleSamples(sampCH);
sampCE = shuffleSamples(sampCE);
sampHE = shuffleSamples(sampHE);

% Podzia� na zbiory testowe i treningowe (doda� p�niej tak�e walidacyjny)
[ sampCnotCTrain sampCnotCTest ] = splitSamples(sampCnotC, 0.7);
%...

% Utworzenie klasyfikator�w SVM

% 

output = sampCnotCTrain;
end

