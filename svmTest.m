function svmTest

trainClasses = [ 1, 1, 1, 1, 2, 2, 2, 2 ]';
trainFeatures = [
    1, 2;
    4, 3;
    2, 3;
    1, 1;
    20, 30;
    23, 19;
    18, 18;
    25, 21
];

testClasses = [ 1, 1, 2 ]';
testFeatures = [
    3, 2;
    2, 0;
    17, 15
];

model = svmtrain(trainFeatures, trainClasses);
result = svmclassify(model, testFeatures);
correct = sum(result == testClasses);
disp(correct);

end