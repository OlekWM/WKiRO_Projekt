function [ output ] = main( filename, wndSize )
% Testowa g³ówna funkcja, parametry wyjœciowe testowo ustalane, ¿eby
% zobaczyæ na aktualny etapie projektu

% Wczytanie bia³ek z pliku
disp('Wczytywanie danych');
proteins = loadProteins(filename);

% Utworzenie próbek o zadanym rozmiarze okna (próbka -> klasa)
disp('Tworzenie próbek dla rozmiaru okna');
samples = proteins2Samples(proteins, wndSize);

% Utworzenie zbiorów próbek klas binarnych
disp('Konwersja na klasy binarne');
sampCnotC = createBinarySamples(samples, @class2CnotC);
%sampHnotH = createBinarySamples(samples, @class2HnotH);
%sampEnotE = createBinarySamples(samples, @class2EnotE);
%sampCH = createBinarySamples(samples, @class2CH);
%sampCE = createBinarySamples(samples, @class2CE);
%sampHE = createBinarySamples(samples, @class2HE);

% Losowa kolejnoœæ próbek
disp('Losowanie');
sampCnotC = shuffleSamples(sampCnotC);
%sampHnotH = shuffleSamples(sampHnotH);
%sampEnotE = shuffleSamples(sampEnotE);
%sampCH = shuffleSamples(sampCH);
%sampCE = shuffleSamples(sampCE);
%sampHE = shuffleSamples(sampHE);

% Podzia³ na zbiory testowe i treningowe (dodaæ póŸniej tak¿e walidacyjny)
disp('Podzia³ na zbiór treningowy i testowy');
[sampCnotCTrain, sampCnotCTest] = splitSamples(sampCnotC, 0.2);
%...

% Utworzenie klasyfikatorów SVM
disp('Wyznaczanie modelu SVM');
train = convertOlekTable(sampCnotCTrain(:, 1));
test = convertOlekTable(sampCnotCTest(:, 1));
model = svmtrain(train, sampCnotCTrain(:, 2));
result = svmclassify(model, test, false);

correct = sum(sampCnotCTest(2, :) == result);
disp(correct);

output = sampCnotCTrain;
end

% Konwersja typu danych wejœciowych dla SVM
function result = convertOlekTable(tab)
    count = length(tab);
    first = tab{1};
    result = zeros(count, length(first) * 25);
    for i = 1 : count,
        element = tab(i);
        result(i, :) = cell2mat([element{:}]);
    end;
end
