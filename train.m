function [ validationResults, testResults  ] = train( training, validation, test, gamma, c )
% Tworzy klasyfikator svm dla podanych parametrów gamma i c a nastêpnie go
% ocenia wzglêdem zbioru walidacyjnego i testowego.
% 
% training - zbiór treningowy
% validation - zbiór walidacyjny
% test - zbiór testowy
% gamma - parametr gamma dla SVM
% c - parametr C dla SVM

% Wyznacznie modeli klasyfikatorów binarnych
[modelHnotH, validationAccHnotH, testAccHnotH] = createBinaryClassifier(training, validation, test, @class2HnotH, gamma, c);
[modelCE, validationAccCE, testAccCE] = createBinaryClassifier(training, validation, test, @class2CE, gamma ,c);

validationFeatures = convertFeatures(validation(:, 1));
validationExpected = validation(:, 2);
validationR = hierarchicalClassifier(modelHnotH, modelCE, 'HCE', validationFeatures);

testFeatures = convertFeatures(test(:, 1));
testExpected = test(:, 2);
testR = hierarchicalClassifier(modelHnotH, modelCE, 'HCE', testFeatures);

% Wyliczanie miar Q dla klas wzglêdem zbioru walidacyjnego i testowego.
valQe = Qclass(validationR, validationExpected, 'E');
valQc = Qclass(validationR, validationExpected, 'C');
valQh = Qclass(validationR, validationExpected, 'H');

testQe = Qclass(testR, testExpected, 'E');
testQc = Qclass(testR, testExpected, 'C');
testQh = Qclass(testR, testExpected, 'H');

validationAcc = checkAccuracy(validationR, validationExpected);
testAcc = checkAccuracy(testR, testExpected);

validationResults = [ validationAcc, valQh(1), valQc(1), valQe(1), validationAccHnotH(1), validationAccCE(1) ];
testResults = [ testAcc, testQh(1), testQc(1), testQe(1), testAccHnotH(1), testAccCE(1) ];
end


