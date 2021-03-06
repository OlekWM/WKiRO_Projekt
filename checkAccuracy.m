function acc = checkAccuracy(result, expected)
% Funkcja wyliczająca dokładność jako procent poprawnych przewidywań

correct = 0;
testLength = length(expected);
for i = 1 : testLength
    if (cell2mat(expected(i)) == cell2mat(result(i)))
        correct = correct + 1;
    end
end
acc = correct / testLength;

end