function [ output ] = main( filename, wndSize )
% Testowa g��wna funkcja, parametry wyj�ciowe testowo ustalane, �eby
% zobaczy� na aktualny etapie projektu

% Wczytanie bia�ek z pliku
disp('Wczytywanie danych');
proteins = loadProteins(filename);

% Utworzenie pr�bek o zadanym rozmiarze okna (pr�bka -> klasa)
disp('Tworzenie pr�bek dla rozmiaru okna');
samples = proteins2Samples(proteins, wndSize);

% Utworzenie zbior�w pr�bek klas binarnych
disp('Konwersja na klasy binarne');
sampCnotC = createBinarySamples(samples, @class2CnotC);
%sampHnotH = createBinarySamples(samples, @class2HnotH);
%sampEnotE = createBinarySamples(samples, @class2EnotE);
%sampCH = createBinarySamples(samples, @class2CH);
%sampCE = createBinarySamples(samples, @class2CE);
%sampHE = createBinarySamples(samples, @class2HE);

% Losowa kolejno�� pr�bek
disp('Losowanie');
sampCnotC = shuffleSamples(sampCnotC);
%sampHnotH = shuffleSamples(sampHnotH);
%sampEnotE = shuffleSamples(sampEnotE);
%sampCH = shuffleSamples(sampCH);
%sampCE = shuffleSamples(sampCE);
%sampHE = shuffleSamples(sampHE);

% Podzia� na zbiory testowe i treningowe (doda� p�niej tak�e walidacyjny)
disp('Podzia� na zbi�r treningowy i testowy');
[sampCnotCTrain, sampCnotCTest] = splitSamples(sampCnotC, 0.2);
%...

% Utworzenie klasyfikator�w SVM
disp('Wyznaczanie modelu SVM');
train = convertOlekTable(sampCnotCTrain(:, 1));
test = convertOlekTable(sampCnotCTest(:, 1));
model = svmtrain(train, sampCnotCTrain(:, 2));
result = svmclassify(model, test, false);

correct = sum(sampCnotCTest(2, :) == result);
disp(correct);

output = sampCnotCTrain;
end

% Konwersja typu danych wej�ciowych dla SVM
function result = convertOlekTable(tab)
    count = length(tab);
    first = tab{1};
    result = zeros(count, length(first) * 25);
    for i = 1 : count,
        element = tab(i);
        result(i, :) = cell2mat([element{:}]);
    end;
end
