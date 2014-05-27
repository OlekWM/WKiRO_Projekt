function result = convertFeatures(ortoVectFeatures)
% Konwersja typu danych wejœciowych dla SVM

featValues = [4.92, 4.92, 4.04, 4.04, 2.98, 2.35, 2.33, 1.81, 1.28, 0.94, -0.14, -2.57, -3.4, -4.66, -5.54, -5.55, -6.64, -6.81, -8.72, -14.92];
count = length(ortoVectFeatures);
first = ortoVectFeatures{1};
%b = [1:1:length(first)];
b = ones(1, length(first));
%result = zeros(count, length(first) * 20);
result = zeros(count, length(first));
for i = 1 : count,
    element = ortoVectFeatures(i);
    temp = element{:};
    temp = temp';
    temp = cell2mat(temp);
    temp = featValues * temp';
    %result(i, :) = cell2mat([element{:}]);
    result(i, :) = temp;
end;

end