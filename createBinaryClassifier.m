function [model, acc] = createBinaryClassifier(train, test, classFunc)
% Funkcja tworzy model klasyfikatora SVM dla podanego zbioru treningowego.
% Zbiór treningowy posiada pe³ne informacje o klasach docelowych, które s¹
% konwertowane na klasy binarne przy pomocy classFunc.
% Przy pomocy zbioru testowego dodatkowo sprawdzana jest dok³adnoœæ
% stworzonego klasyfikatora binarnego.

disp('Wyznaczanie modelu SVM');

% Konwersja klas aminokwasow na klasy binarne
binaryTrain = createBinarySamples(train, classFunc);
binaryTest = createBinarySamples(test, classFunc);

featuresTrain = convertOlekTable(binaryTrain(:, 1));
featuresTest = convertOlekTable(binaryTest(:, 1));
labelsTrain = binaryTrain(:, 2);
labelsTest = binaryTest(:, 2);

% Wyznaczenie modelu klasyfikatora SVM
model = svmtrain(featuresTrain, labelsTrain, 'kernel_function', 'rbf', 'autoscale', false);

% Kontrola dok³adnoœci klasyfikatora binarnego
result = svmclassify(model, featuresTest);
correct = 0;
testLength = length(result);
for i = 1 : testLength
    if (cell2mat(labelsTest(i)) == cell2mat(result(i)))
        correct = correct + 1;
    end
end
acc = correct / testLength;

end

% TODO: Wydzielenie do osobnego pliku
% Konwersja typu danych wejœciowych dla SVM
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
