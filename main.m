function [ output ] = main( filename, wndSize, limit )
% Testowa g³ówna funkcja, parametry wyjœciowe testowo ustalane, ¿eby
% zobaczyæ na aktualny etapie projektu

% Wczytanie bia³ek z pliku
disp('Wczytywanie danych');
proteins = loadProteins(filename);

% Utworzenie próbek o zadanym rozmiarze okna (próbka -> klasa)
disp('Tworzenie próbek dla rozmiaru okna');
limit = min(limit, length(proteins));
samples = proteins2Samples(proteins(1:limit), wndSize);

% Podzia³ na zbiór treningowy i testowy
samples = shuffleSamples(samples);
[trainSamples, testSamples] = splitSamples(samples, 0.6);

% Wyznacznie modeli klasyfikatorów binarnych
[modelHnotH, accHnotH] = createBinaryClassifier(trainSamples, testSamples, @class2HnotH);
[modelCE, accCE] = createBinaryClassifier(trainSamples, testSamples, @class2CE);

testFeatures = convertFeatures(testSamples(:, 1));
testExpected = testSamples(:, 2);
testResult = hierarchicalClassifier(modelHnotH, modelCE, '~H', testFeatures);
testAcc = checkAccuracy(testResult, testExpected);

output = [ testAcc, accHnotH, accCE ];
end

