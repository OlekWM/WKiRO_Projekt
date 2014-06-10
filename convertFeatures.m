function result = convertFeatures(ortoVectFeatures)
% Konwersja typu danych wejœciowych dla SVM

% Dla pozostawienia wektora hydro bez sumowania zakomentowac 4
% niezakomentowane linijki i odkomentowac ponizsza:
 result = cell2mat(ortoVectFeatures);

%temp = cell2mat(ortoVectFeatures);
%len = size(temp, 2);
%onesMatrix = ones(len,1);
%result = temp * onesMatrix;

end