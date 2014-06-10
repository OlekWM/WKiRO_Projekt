function [model, valAcc, testAcc] = createBinaryClassifier(train, validation, test, classFunc, gamma, c)
% Funkcja tworzy model klasyfikatora SVM dla podanego zbioru treningowego.
% Zbi�r treningowy posiada pe�ne informacje o klasach docelowych, kt�re s�
% konwertowane na klasy binarne przy pomocy classFunc.
% Dodatkowo wyznaczana jest dok�adno�� klasyfikatora dla zbioru
% walidacyjnego oraz testowego.

disp('Wyznaczanie modelu SVM');

% Konwersja klas aminokwasow na klasy binarne
binaryTrain = createBinarySamples(train, classFunc);
binaryValidation = createBinarySamples(validation, classFunc);
binaryTest = createBinarySamples(test, classFunc);

featuresTrain = convertFeatures(binaryTrain(:, 1));
featuresValidation = convertFeatures(binaryValidation(:, 1));
featuresTest = convertFeatures(binaryTest(:, 1));
labelsTrain = cell2mat(binaryTrain(:, 2));
labelsValidation = cell2mat(binaryValidation(:, 2));
labelsTest = cell2mat(binaryTest(:, 2));

% Wyznaczenie modelu klasyfikatora SVM
parameters = strcat('-s 0 -t 2 -g ', num2str(gamma), ' -c ', num2str(c));
model = svmtrain(labelsTrain, featuresTrain, parameters);

% Kontrola dok�adno�ci klasyfikatora binarnego
[~, valAcc, ~] = svmpredict(labelsValidation, featuresValidation, model);
[~, testAcc, ~] = svmpredict(labelsTest, featuresTest, model);
end
