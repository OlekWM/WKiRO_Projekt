function [ output ] = main( filename, wndSize, limit )
% Testowa g��wna funkcja, parametry wyj�ciowe testowo ustalane, �eby
% zobaczy� na aktualny etapie projektu

% Wczytanie bia�ek z pliku
disp('Wczytywanie danych');
proteins = loadProteins(filename);

% Utworzenie pr�bek o zadanym rozmiarze okna (pr�bka -> klasa)
disp('Tworzenie pr�bek dla rozmiaru okna');
limit = min(limit, length(proteins));
samples = proteins2Samples(proteins(1:limit), wndSize);

% Podzia� na zbi�r treningowy i testowy
samples = shuffleSamples(samples);
[trainSamples, testSamples] = splitSamples(samples, 0.6);

% Wyznacznie modeli klasyfikator�w binarnych
[modelHnotH, accHnotH] = createBinaryClassifier(trainSamples, testSamples, @class2HnotH);
[modelCE, accCE] = createBinaryClassifier(trainSamples, testSamples, @class2CE);

output = [ accHnotH, accCE ];
end

