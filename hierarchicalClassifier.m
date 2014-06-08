function result = hierarchicalClassifier(modelA, modelB, skipClass, features)

fakeLabels = zeros(size(features,1),1);

[ resultA, ~, ~ ] = svmpredict(fakeLabels, features, modelA);
[ resultB, ~, ~ ] = svmpredict(fakeLabels, features, modelB);

for i = 1 : length(resultA)
   if resultA(i) == 1
      result(i) = 'H';
   elseif resultB(i) == 1
      result(i) = 'C';
   else
      result(i) = 'E';
   end
end

end