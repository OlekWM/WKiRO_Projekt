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
model = svmtrain(train, sampCnotCTrain(:, 2), 'kernel_function', 'rbf');
result = svmclassify(model, test);

correct = 0;
testLength = length(result);
for i = 1 : testLength
    if(cell2mat(sampCnotC(i, 2)) == cell2mat(result(i)))
        correct = correct + 1;
    end
    %correct = sum(sampCnotCTest(2, :) == result);
end
disp(correct);
disp(testLength);
disp(correct / testLength);


output = sampCnotCTrain;
end

% Konwersja typu danych wej�ciowych dla SVM
function result = convertOlekTable(tab)
    featValues = [4.92, 4.92, 4.04, 4.04, 2.98, 2.35, 2.33, 1.81, 1.28, 0.94, -0.14, -2.57, -3.4, -4.66, -5.54, -5.55, -6.64, -6.81, -8.72, -14.92];
    count = length(tab);
    first = tab{1};
    %b = [1:1:length(first)];
    b = ones(1, length(first));
    %result = zeros(count, length(first) * 20);
    result = zeros(count, length(first));
    for i = 1 : count,
        element = tab(i);
        temp = element{:};
        temp = temp';
        temp = cell2mat(temp);
        temp = featValues * temp';
        %result(i, :) = cell2mat([element{:}]);
        result(i, :) = temp;
    end;
end
