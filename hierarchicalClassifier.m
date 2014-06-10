function result = hierarchicalClassifier(modelA, modelB, classHierarchy, features)
% classHierarchy - po kolei klasy dla ka¿dego poziomu hierarchi:
% element 1 - klasa dla pozytywnego wyniku pierwszego modelu
% element 2 - klasa dla pozytwynego wyniku drugiego modelu (negatywny 1)
% element 3 - klasa dla negatywnego wyniku drugiego modelu (negatywny 1)

fakeLabels = zeros(size(features,1),1);

[ resultA, ~, ~ ] = svmpredict(fakeLabels, features, modelA);
[ resultB, ~, ~ ] = svmpredict(fakeLabels, features, modelB);

for i = 1 : length(resultA)
   if resultA(i) == 1
      result(i) = classHierarchy(1);
   elseif resultB(i) == 1
      result(i) = classHierarchy(2);
   else
      result(i) = classHierarchy(3);
   end
end

end