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
[trainSamples, testSamples] = splitSamples(samples, 0.7);

% Wyznacznie modeli klasyfikator�w binarnych
[modelHnotH, accHnotH] = createBinaryClassifier(trainSamples, testSamples, @class2HnotH);
[modelCE, accCE] = createBinaryClassifier(trainSamples, testSamples, @class2CE);

%[~, accCnotC] = createBinaryClassifier(trainSamples, testSamples, @class2CnotC);
%[~, accEnotE] = createBinaryClassifier(trainSamples, testSamples, @class2EnotE);
%[~, accCH] = createBinaryClassifier(trainSamples, testSamples, @class2CH);
%[~, accHE] = createBinaryClassifier(trainSamples, testSamples, @class2HE);

testFeatures = convertFeatures(testSamples(:, 1));
testExpected = testSamples(:, 2);
testResult = hierarchicalClassifier(modelHnotH, modelCE, '~H', testFeatures);

Qe = Qclass(testResult, testExpected, 'E')
Qc = Qclass(testResult, testExpected, 'C')
Qh = Qclass(testResult, testExpected, 'H')

testAcc = checkAccuracy(testResult, testExpected);
output = [ testAcc, accHnotH(1), accCE(1) ];
end

