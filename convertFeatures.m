function result = convertFeatures(ortoVectFeatures)
% Konwersja typu danych wej�ciowych dla SVM

temp = cell2mat(ortoVectFeatures);
len = size(temp, 2);
onesMatrix = ones(len,1);
result = temp * onesMatrix;

end