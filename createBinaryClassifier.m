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
labelsTrain = binaryTrain(:, 2);
labelsTest = binaryTest(:, 2);

% Wyznaczenie modelu klasyfikatora SVM
model = svmtrain(featuresTrain, labelsTrain, 'kernel_function', 'rbf', 'autoscale', false);

% Kontrola dok�adno�ci klasyfikatora binarnego
result = svmclassify(model, featuresTest);
acc = checkAccuracy(result, labelsTest);

end
