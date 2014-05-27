function result = hierarchicalClassifier(modelA, modelB, skipClass, features)

result = svmclassify(modelA, features);
resultB = svmclassify(modelB, features);

for i = 1 : length(result)
   if cell2mat(result(i)) == skipClass
      result(i) = resultB(i); 
   end
end

end