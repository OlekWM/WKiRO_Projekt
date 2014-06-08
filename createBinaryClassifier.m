function [model, acc] = createBinaryClassifier(train, test, classFunc)
% Funkcja tworzy model klasyfikatora SVM dla podanego zbioru treningowego.
% Zbi�r treningowy posiada pe�ne informacje o klasach docelowych, kt�re s�
% konwertowane na klasy binarne przy pomocy classFunc.
% Przy pomocy zbioru testowego dodatkowo sprawdzana jest dok�adno��
% stworzonego klasyfikatora binarnego.

disp('Wyznaczanie modelu SVM');

% Konwersja klas aminokwasow na klasy binarne
binaryTrain = createBinarySamples(train, classFunc);
binaryTest = createBinarySamples(test, classFunc);

featuresTrain = convertFeatures(binaryTrain(:, 1));
featuresTest = convertFeatures(binaryTest(:, 1));
labelsTrain = cell2mat(binaryTrain(:, 2));
labelsTest = cell2mat(binaryTest(:, 2));

% Wyznaczenie modelu klasyfikatora SVM
model = svmtrain(labelsTrain, featuresTrain, '-s 0 -t 2 -g 0.1 -c 1.5');

% Kontrola dok�adno�ci klasyfikatora binarnego
[~, acc, ~] = svmpredict(labelsTest, featuresTest, model);
end
